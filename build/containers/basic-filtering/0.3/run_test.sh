# get actual output of the tool

export CMO_RESOURCE_CONFIG=/usr/bin/basicfiltering/data/cmo_resources.json

exec /usr/bin/runscript.sh pindel 2>&1 | head -1 >> /srv/actual.diff.txt
exec /usr/bin/runscript.sh mutect 2>&1 | head -1 >> /srv/actual.diff.txt
exec /usr/bin/runscript.sh vardict 2>&1 | head -1 >> /srv/actual.diff.txt
exec /usr/bin/runscript.sh complex 2>&1 | head -1 >> /srv/actual.diff.txt

# expected output
cat > /srv/expected.diff.txt << EOM
usage: filter_pindel.py [options]
usage: filter_mutect.py [options]
usage: filter_vardict.py [options]
usage: filter_complex.py [options]
EOM

# diff
exitCode=0
cat /srv/expected.diff.txt | tr -d "[:space:]" > /srv/expected.diff.txt
cat /srv/actual.diff.txt | tr -d "[:space:]" > /srv/actual.diff.txt
if ! cmp -s /srv/actual.diff.txt /srv/expected.diff.txt
then
	diff /srv/actual.diff.txt /srv/expected.diff.txt
	exitCode=1
fi
# delete tmp
rm -rf /srv/*.diff.txt
exit $exitCode