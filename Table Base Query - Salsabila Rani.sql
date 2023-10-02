use sales_kimfar;

-- business case #1: 
-- melihat total pendapatan dari penjualan masing-masing produk
select penj.id_barang, 
brg.nama_barang,
penj.harga
from penjualan penj
left join barang brg on penj.id_barang = brg.kode_barang;

-- business case #2: 
-- melihat total pendapatan dari penjualan masing-masing lini berdasarkan pelanggan
select penj.id_cabang,
pel.nama,
penj.lini,
penj.harga
from penjualan penj
left join pelanggan pel
on penj.id_cabang = pel.id_cabang_sales;

-- business case #3: 
-- melihat segmentasi customer setiap daerah cabang
select penj.id_barang,
brg.nama_barang,
pel.id_cabang_sales,
pel.cabang_sales,
penj.jumlah_barang,
penj.harga
from penjualan penj
left join pelanggan pel on penj.id_cabang = pel.id_cabang_sales
left join barang brg on penj.id_barang = brg.kode_barang;

-- business case #4
-- melihat informasi perkembangan sales setiap produk setiap bulan
select tanggal,
month(str_to_date(tanggal,'%m/%d/%Y')) as bulan,
penj.id_barang,
brg.nama_barang,
penj.jumlah_barang,
penj.harga
from penjualan penj
left join barang brg on penj.id_barang = brg.kode_barang
order by bulan;
