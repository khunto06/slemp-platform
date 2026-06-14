---
layout: default
title: SLEMP
description: Simple Linux Engine-X Monitoring Platform untuk instalasi Nginx, MariaDB, PHP-FPM, firewall, dan dashboard server secara cepat.
---

<section id="features" class="section-card">

<h2 class="section-title">Fitur Utama</h2>

<div class="grid-3">
  <div class="feature-box">
    <div class="icon">🚀</div>
    <h3>One Command Install</h3>
    <p>Instalasi stack server hanya dengan satu perintah curl yang mudah dijalankan.</p>
  </div>

  <div class="feature-box">
    <div class="icon">🖥️</div>
    <h3>Dashboard Ringan</h3>
    <p>Tampilan awal dashboard modern untuk memastikan service berjalan dengan baik.</p>
  </div>

  <div class="feature-box">
    <div class="icon">🔐</div>
    <h3>Firewall Ready</h3>
    <p>Installer otomatis membuka port dashboard jika UFW atau firewalld tersedia.</p>
  </div>
</div>

</section>

<section id="install" class="section-card">

<h2 class="section-title">Bagaimana cara pasang SLEMP?</h2>

<h3>Persyaratan Sistem</h3>

<div class="grid-3">
  <div class="feature-box">
    <h3>Memori</h3>
    <ul>
      <li>Minimum 512MB</li>
      <li>Disarankan 1GB atau lebih</li>
      <li>Swap disarankan aktif</li>
    </ul>
  </div>

  <div class="feature-box">
    <h3>Disk</h3>
    <ul>
      <li>Minimal 4GB kosong</li>
      <li>SSD lebih disarankan</li>
      <li>Server harus bersih</li>
    </ul>
  </div>

  <div class="feature-box">
    <h3>Sistem Operasi</h3>
    <ul>
      <li>Debian</li>
      <li>Ubuntu</li>
      <li>AlmaLinux / Rocky Linux</li>
    </ul>
  </div>
</div>

<br>

<div class="notice">
  Pastikan server belum terinstall Apache, Nginx, PHP, MySQL, atau MariaDB sebelumnya agar proses instalasi lebih bersih.
</div>

<h3>Perintah Pemasangan</h3>

<div class="code-wrap">
<button class="copy-btn" data-copy="#install-command">Copy</button>

<pre id="install-command" class="code-box"><code>curl -fsSL https://khunto06.github.io/slemp-platform/slemp.sh | bash</code></pre>
</div>

<h3>Jika menggunakan domain sendiri</h3>

<div class="code-wrap">
<button class="copy-btn" data-copy="#install-domain-command">Copy</button>

<pre id="install-domain-command" class="code-box"><code>curl -fsSL https://domain-kamu.com/slemp.sh | bash</code></pre>
</div>

</section>

<section id="steps" class="section-card">

<h2 class="section-title">Langkah Deploy di GitHub Pages</h2>

<div class="steps">
  <div class="step">
    <div>
      <h3>Buat Repository</h3>
      <p>Buat repository GitHub bernama <strong>slemp-platform</strong>.</p>
    </div>
  </div>

  <div class="step">
    <div>
      <h3>Upload File</h3>
      <p>Upload file <strong>_config.yml</strong>, <strong>index.md</strong>, <strong>slemp.sh</strong>, folder <strong>_layouts</strong>, <strong>_includes</strong>, dan <strong>assets</strong>.</p>
    </div>
  </div>

  <div class="step">
    <div>
      <h3>Aktifkan GitHub Pages</h3>
      <p>Masuk ke <strong>Settings → Pages → Deploy from branch → main → root</strong>.</p>
    </div>
  </div>
</div>

</section>

<section id="stack" class="section-card">

<h2 class="section-title">Technology Stack</h2>

<div class="grid-3">
  <div class="feature-box">
    <h3>Nginx</h3>
    <p>Web server ringan, cepat, dan cocok untuk VPS kecil sampai produksi.</p>
  </div>

  <div class="feature-box">
    <h3>MariaDB</h3>
    <p>Database server stabil sebagai pengganti MySQL untuk aplikasi modern.</p>
  </div>

  <div class="feature-box">
    <h3>PHP-FPM</h3>
    <p>Menjalankan aplikasi PHP dengan performa lebih baik dan hemat resource.</p>
  </div>
</div>

</section>

<section id="screenshot" class="section-card">

<h2 class="section-title">Screenshot</h2>

<p>Upload gambar <strong>slemp.png</strong>, <strong>monitor.png</strong>, dan <strong>firewall.png</strong> ke repository agar tampil di bagian ini.</p>

<div class="screenshot-grid">
  <img class="screenshot" src="slemp.png" alt="SLEMP Dashboard">
  <img class="screenshot" src="monitor.png" alt="SLEMP Monitor">
  <img class="screenshot" src="firewall.png" alt="SLEMP Firewall">
</div>

</section>

<section id="demo" class="section-card">

<h2 class="section-title">Demo</h2>

<p>Setelah SLEMP diinstall, dashboard bisa diakses melalui:</p>

<div class="code-wrap">
<pre class="code-box"><code>http://IP-SERVER:12345</code></pre>
</div>

</section>
