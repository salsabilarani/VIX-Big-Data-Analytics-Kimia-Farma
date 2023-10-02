use datamart_project;

-- data mart #1
-- diambil dari tabel business case #1
-- melihat total pendapatan dari penjualan masing-masing produk
select distinct(nama_barang) as nama_produk,
round(sum(harga), 2) as total_penjualan
from `business case #1`
group by nama_produk;

-- data mart #2
-- diambil dari tabel business case #2
-- melihat total pendapatan dari penjualan masing-masing lini berdasarkan pelanggan
select distinct(lini),
nama as nama_pelanggan,
round(sum(harga), 2) as pendapatan_pelanggan
from `business case #2`
where nama is not null
group by 1,2
order by 1 asc;

-- data mart #3
-- diambil dari tabel business case #3
-- melihat segmentasi customer setiap daerah cabang
select distinct(cabang_sales),
nama_barang as nama_produk,
sum(jumlah_barang) as produk_terjual,
round(sum(harga), 2) as pendapatan_produk
from `business case #3`
where cabang_sales is not null
group by 1,2
order by 1,2 desc;

-- data mart #4
-- diambil dari tabel business case #4
-- melihat informasi perkembangan sales setiap produk setiap bulan
select tanggal, 
nama_barang,
sum(jumlah_barang) as produk_terjual
from `business case #4`
group by 1,2
order by 1,2,3 desc;

-- data mart #5
-- diambil dari tabel business case #4
-- melihat revenue growth setiap bulan
select bulan,
(round(sum(harga),2)) as pendapatan_bulan,
(sum(harga)) - lag(sum(harga)) over (order by bulan asc) as revenue_growth,
(sum(harga) - LAG (sum(harga)) OVER (ORDER BY bulan ASC))/LAG (sum(harga)) OVER (ORDER BY bulan ASC)*100 
AS revenue_percentage_growth
from `business case #4`
group by bulan;