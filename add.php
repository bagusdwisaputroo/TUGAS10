<?php
 if (isset($_POST['submit'])) {
  //Include file koneksi, untuk koneksikan ke database
  include 'koneksi.php';
  $no_faktur=$_POST['no_faktur'];
  $kepada = $_POST['kepada'];
  $tanggal = $_POST['tanggal'];
  $qnty = $_POST['qnty'];
  $discount = $_POST['discount'];
  $total = $_POST['total'];

  // id_produk bernilai '' karena kita set auto increment
 
  $sql="insert INTO transaksi (no_faktur,kepada,tanggal,qnty,discount,total) VALUES
  ('$no_faktur', '$kepada', '$tanggal','$qnty','$discount','$total')";
  $query = mysqli_query($koneksi, $sql);	
  
  if ($sql) {
    // pesan jika data tersimpan
    echo "<script>alert('Data Transaksi berhasil ditambahkan'); 
	window.location.href='index.php'</script>"; 
  } else {
    // pesan jika data gagal disimpan
    echo "<script>alert('Data Transaksi gagal ditambahkan');
	window.location.href='index.php'</script>";
  }
} else {
  // jika coba akses langsung halaman ini akan diredirect ke halaman index
  header('Location: index.php');
}