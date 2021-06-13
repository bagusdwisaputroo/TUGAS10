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
 
  $sql="UPDATE transaksi SET no_faktur = '$no_faktur', kepada ='$kepada', tanggal ='$tanggal', qnty ='$qnty', discount ='$discount',total='$total' WHERE no_faktur = '$no_faktur'";
  $query = mysqli_query($koneksi, $sql);	

  if ($sql) {
    // pesan jika data berubah
    echo "<script>alert('Data produk berhasil diubah'); window.location.href='index.php'</script>";
  } else {
    // pesan jika data gagal diubah
    echo "<script>alert('Data produk gagal diubah'); window.location.href='index.php'</script>";
  }
} else {
  // jika coba akses langsung halaman ini akan diredirect ke halaman index
  header('Location: index.php');
}