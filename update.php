<?php

// cek no_faktur
if (isset($_GET['no_faktur'])) {
  include 'koneksi.php';
  $no_faktur = $_GET['no_faktur'];
 
  // ambil data berdasarkan no_faktur
  $sql="SELECT * FROM transaksi WHERE no_faktur ='$no_faktur'";
  //$no=1;
  $query = mysqli_query($koneksi, $sql);		
  while ($row = mysqli_fetch_array($query))
  {
  ?>

  <h2>Halaman Update Data</h2>

  <form method="post" action="proses_update.php">
    <input type="text" name="no_faktur" value="<?php echo $row['no_faktur']?>">
    <input type="char" name="kepada" value="<?php echo $row['kepada'] ?>">
    <input type="varchar" name="tanggal" value="<?php echo $row['tanggal'] ?>">
    <input type="number" name="qnty" value="<?php echo $row['qnty'] ?>">
    <input type="number" name="discount" value="<?php echo $row['discount'] ?>">
    <input type="number" name="total" value="<?php echo $row['total'] ?>">
    <input type="submit" name="submit" value="Update Data">
  </form>

  <?php
 
}}
