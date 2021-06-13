<?php

// cek no_faktur
if (isset($_GET['no_faktur'])) {
  include 'koneksi.php';
  $no_faktur = $_GET['no_faktur'];
 

  // perintah hapus data berdasarkan no_faktur yang dikirimkan
  $sql="DELETE FROM transaksi WHERE no_faktur ='$no_faktur'";
  $query = mysqli_query($koneksi,$sql);	
  
  // cek perintah
  if ($sql) {
    // pesan apabila hapus berhasil
    echo "<script>alert('Data berhasil dihapus'); window.location.href='index.php'</script>";
  } else {
    // pesan apabila hapus gagal
    echo "<script>alert('Data berhasil dihapus'); window.location.href='index.php'</script>";
  }
} else {
  // jika mencoba akses langsung ke file ini akan diredirect ke halaman index
  header('Location:index.php');
}