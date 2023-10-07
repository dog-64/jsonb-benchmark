echo Update order

echo Benchmark For actors.roles

echo Benchmark Table Kind
sudo pg_ctlcluster 14 main restart
pgbench -U postgres -f kind_table.sql -c 10 -t 1000000 imdb

echo Benchmark Arch Kind
sudo pg_ctlcluster 14 main restart
pgbench -U postgres -f kind_arch.sql -c 10 -t 1000000 imdb

echo Benchmark Toast Kind
sudo pg_ctlcluster 14 main restart
pgbench -U postgres -f kind_toast.sql -c 10 -t 1000000 imdb

echo Benchmark Toast3 Kind
sudo pg_ctlcluster 14 main restart
pgbench -U postgres -f kind_toast3.sql -c 10 -t 1000000 imdb
