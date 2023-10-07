echo Update order
psql -U postgres -d imdb -c "UPDATE actors SET random_order = floor(random() * 1000000)::INT"

echo Benchmark For actors.roles

#echo Benchmark Table Kind
#pgbench -f kind_table.sql -c 10 -t 1000000 imdb

#echo Benchmark Arch Kind
#pgbench -f kind_arch.sql -c 10 -t 1000000 imdb

#echo Benchmark Toast Kind
#pgbench -f kind_toast.sql -c 10 -t 1000000 imdb

echo Benchmark Toast3 Kind
pgbench -f kind_toast3.sql -c 10 -t 1000000 imdb
