<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>OGDRIP — Drop Culture</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Space+Grotesk:wght@300;400;500;600;700&family=DM+Mono:ital,wght@0,300;0,400;1,300&display=swap" rel="stylesheet">
<style>
  :root {
    --bg: #050505;
    --surface: #0d0d0d;
    --surface2: #161616;
    --border: #222;
    --neon: #c8ff00;
    --neon2: #ff3cac;
    --neon3: #00f5ff;
    --text: #f0f0f0;
    --muted: #666;
    --white: #ffffff;
    --font-display: 'Bebas Neue', sans-serif;
    --font-body: 'Space Grotesk', sans-serif;
    --font-mono: 'DM Mono', monospace;
    --radius: 4px;
    --transition: all 0.3s cubic-bezier(0.16, 1, 0.3, 1);
  }

  *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

  html { scroll-behavior: smooth; }

  body {
    background: var(--bg);
    color: var(--text);
    font-family: var(--font-body);
    overflow-x: hidden;
    cursor: none;
  }

  /* CUSTOM CURSOR */
  #cursor {
    width: 12px; height: 12px;
    background: var(--neon);
    border-radius: 50%;
    position: fixed; top: 0; left: 0;
    pointer-events: none; z-index: 9999;
    transform: translate(-50%, -50%);
    transition: transform 0.1s, width 0.3s, height 0.3s, background 0.3s;
    mix-blend-mode: difference;
  }
  #cursor.hover { width: 40px; height: 40px; background: var(--neon2); }

  /* SCROLLBAR */
  ::-webkit-scrollbar { width: 3px; }
  ::-webkit-scrollbar-track { background: var(--bg); }
  ::-webkit-scrollbar-thumb { background: var(--neon); }

  /* NAV */
  nav {
    position: fixed; top: 0; left: 0; right: 0; z-index: 100;
    display: flex; justify-content: space-between; align-items: center;
    padding: 20px 40px;
    background: rgba(5,5,5,0.85);
    backdrop-filter: blur(20px);
    border-bottom: 1px solid rgba(200,255,0,0.08);
    transition: var(--transition);
  }

  .logo {
    font-family: var(--font-display);
    font-size: 32px;
    letter-spacing: 6px;
    background: linear-gradient(135deg, var(--neon) 0%, var(--neon3) 100%);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    cursor: pointer;
  }

  .nav-links {
    display: flex; gap: 36px; list-style: none;
  }
  .nav-links a {
    font-family: var(--font-mono);
    font-size: 11px;
    letter-spacing: 3px;
    text-transform: uppercase;
    color: var(--muted);
    text-decoration: none;
    transition: var(--transition);
    cursor: pointer;
  }
  .nav-links a:hover { color: var(--neon); }

  .nav-actions {
    display: flex; gap: 20px; align-items: center;
  }

  .cart-btn {
    position: relative;
    background: none; border: 1px solid var(--border);
    color: var(--text); padding: 10px 20px;
    font-family: var(--font-mono); font-size: 11px;
    letter-spacing: 2px; text-transform: uppercase;
    cursor: pointer; transition: var(--transition);
    border-radius: var(--radius);
  }
  .cart-btn:hover { border-color: var(--neon); color: var(--neon); }

  .cart-count {
    position: absolute; top: -8px; right: -8px;
    width: 18px; height: 18px;
    background: var(--neon); color: #000;
    font-size: 10px; font-weight: 700;
    border-radius: 50%;
    display: flex; align-items: center; justify-content: center;
  }

  /* HERO */
  #home {
    height: 100vh; min-height: 700px;
    display: flex; align-items: center; justify-content: center;
    position: relative; overflow: hidden;
    padding-top: 80px;
  }

  .hero-bg {
    position: absolute; inset: 0;
    background:
      radial-gradient(ellipse 80% 60% at 50% 80%, rgba(200,255,0,0.06) 0%, transparent 70%),
      radial-gradient(ellipse 50% 40% at 80% 20%, rgba(0,245,255,0.05) 0%, transparent 60%),
      radial-gradient(ellipse 40% 30% at 20% 50%, rgba(255,60,172,0.05) 0%, transparent 60%);
  }

  .hero-grid {
    position: absolute; inset: 0;
    background-image:
      linear-gradient(rgba(200,255,0,0.04) 1px, transparent 1px),
      linear-gradient(90deg, rgba(200,255,0,0.04) 1px, transparent 1px);
    background-size: 60px 60px;
    animation: gridShift 20s linear infinite;
  }
  @keyframes gridShift { to { background-position: 60px 60px; } }

  .hero-content {
    text-align: center; z-index: 1; padding: 0 20px;
  }

  .hero-eyebrow {
    font-family: var(--font-mono);
    font-size: 11px; letter-spacing: 6px;
    text-transform: uppercase; color: var(--neon);
    margin-bottom: 24px;
    animation: fadeUp 0.8s ease both;
  }

  .hero-title {
    font-family: var(--font-display);
    font-size: clamp(80px, 16vw, 200px);
    line-height: 0.9;
    letter-spacing: 8px;
    animation: fadeUp 0.8s ease 0.1s both;
  }

  .hero-title span {
    display: block;
    background: linear-gradient(135deg, var(--white) 0%, rgba(255,255,255,0.5) 100%);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
  }

  .hero-title .accent {
    background: linear-gradient(135deg, var(--neon) 0%, var(--neon3) 100%);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
  }

  .hero-sub {
    font-size: 14px; color: var(--muted); margin: 24px 0 40px;
    letter-spacing: 2px; text-transform: uppercase;
    font-family: var(--font-mono);
    animation: fadeUp 0.8s ease 0.2s both;
  }

  .hero-ctas {
    display: flex; gap: 16px; justify-content: center;
    animation: fadeUp 0.8s ease 0.3s both;
  }

  .btn-primary {
    background: var(--neon);
    color: #000; border: none;
    padding: 16px 40px;
    font-family: var(--font-mono); font-size: 11px;
    letter-spacing: 3px; text-transform: uppercase;
    cursor: pointer; transition: var(--transition);
    font-weight: 600; border-radius: var(--radius);
  }
  .btn-primary:hover {
    background: var(--neon3); transform: translateY(-2px);
    box-shadow: 0 20px 40px rgba(200,255,0,0.2);
  }

  .btn-outline {
    background: none;
    color: var(--text); border: 1px solid var(--border);
    padding: 16px 40px;
    font-family: var(--font-mono); font-size: 11px;
    letter-spacing: 3px; text-transform: uppercase;
    cursor: pointer; transition: var(--transition);
    border-radius: var(--radius);
  }
  .btn-outline:hover { border-color: var(--neon); color: var(--neon); transform: translateY(-2px); }

  /* TICKER */
  .ticker {
    background: var(--neon);
    color: #000;
    padding: 12px 0;
    overflow: hidden;
    white-space: nowrap;
  }
  .ticker-inner {
    display: inline-flex; gap: 60px;
    animation: ticker 20s linear infinite;
  }
  @keyframes ticker { to { transform: translateX(-50%); } }
  .ticker span {
    font-family: var(--font-display);
    font-size: 14px; letter-spacing: 4px;
  }

  /* SECTION STYLES */
  section { padding: 100px 40px; }

  .section-label {
    font-family: var(--font-mono);
    font-size: 10px; letter-spacing: 6px;
    text-transform: uppercase; color: var(--neon);
    margin-bottom: 12px;
  }

  .section-title {
    font-family: var(--font-display);
    font-size: clamp(40px, 6vw, 80px);
    letter-spacing: 4px;
    line-height: 1;
    margin-bottom: 60px;
  }

  /* NEW DROPS */
  .drops-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
    gap: 2px;
  }

  .product-card {
    background: var(--surface);
    position: relative; overflow: hidden;
    cursor: pointer;
    transition: var(--transition);
    border: 1px solid var(--border);
  }

  .product-card:hover { border-color: var(--neon); z-index: 1; }
  .product-card:hover .product-img-wrap img { transform: scale(1.08); }
  .product-card:hover .card-actions { opacity: 1; transform: translateY(0); }

  .product-img-wrap {
    aspect-ratio: 3/4;
    overflow: hidden;
    background: var(--surface2);
    display: flex; align-items: center; justify-content: center;
    position: relative;
  }

  .product-img-wrap img {
    width: 100%; height: 100%; object-fit: cover;
    transition: transform 0.6s cubic-bezier(0.16, 1, 0.3, 1);
  }

  .product-placeholder {
    width: 100%; height: 100%;
    display: flex; align-items: center; justify-content: center;
    background: var(--surface2);
    flex-direction: column; gap: 8px;
  }

  .placeholder-icon { font-size: 48px; opacity: 0.2; }
  .placeholder-text { font-family: var(--font-mono); font-size: 10px; color: var(--muted); letter-spacing: 2px; }

  .badge {
    position: absolute; top: 12px; left: 12px;
    background: var(--neon); color: #000;
    font-family: var(--font-mono); font-size: 9px;
    letter-spacing: 2px; text-transform: uppercase;
    padding: 4px 10px; font-weight: 600;
    border-radius: var(--radius);
  }

  .badge.hot { background: var(--neon2); color: #fff; }

  .card-actions {
    position: absolute; bottom: 0; left: 0; right: 0;
    padding: 16px;
    background: linear-gradient(transparent, rgba(0,0,0,0.9));
    opacity: 0; transform: translateY(10px);
    transition: var(--transition);
  }

  .add-to-cart-quick {
    width: 100%; background: var(--neon); color: #000;
    border: none; padding: 12px;
    font-family: var(--font-mono); font-size: 10px;
    letter-spacing: 3px; text-transform: uppercase;
    cursor: pointer; font-weight: 600;
    border-radius: var(--radius);
    transition: var(--transition);
  }
  .add-to-cart-quick:hover { background: var(--neon3); }

  .product-info {
    padding: 16px;
    border-top: 1px solid var(--border);
  }

  .product-name {
    font-size: 13px; font-weight: 600; letter-spacing: 1px;
    margin-bottom: 4px;
    text-transform: uppercase;
  }

  .product-price {
    font-family: var(--font-mono);
    font-size: 13px; color: var(--neon);
  }

  .product-variants {
    display: flex; gap: 6px; margin-top: 8px;
  }

  .variant-dot {
    width: 14px; height: 14px; border-radius: 50%;
    border: 1px solid var(--border);
    cursor: pointer; transition: var(--transition);
  }
  .variant-dot:hover { border-color: var(--neon); transform: scale(1.2); }
  .variant-dot.active { border-color: var(--neon); box-shadow: 0 0 0 2px rgba(200,255,0,0.3); }

  /* ABOUT */
  #about {
    background: var(--surface);
    border-top: 1px solid var(--border);
    border-bottom: 1px solid var(--border);
  }

  .about-grid {
    display: grid;
    grid-template-columns: 1fr 1fr;
    gap: 80px;
    align-items: center;
    max-width: 1200px;
    margin: 0 auto;
  }

  .about-visual {
    position: relative;
    aspect-ratio: 1;
  }

  .about-box {
    background: var(--surface2);
    border: 1px solid var(--border);
    height: 100%;
    display: flex; align-items: center; justify-content: center;
    overflow: hidden;
    position: relative;
  }

  .about-box::before {
    content: 'OGDRIP';
    font-family: var(--font-display);
    font-size: 100px;
    letter-spacing: 10px;
    color: rgba(200,255,0,0.04);
    position: absolute;
    white-space: nowrap;
  }

  .about-accent-line {
    width: 60px; height: 2px;
    background: var(--neon);
    margin-bottom: 24px;
  }

  .about-text h3 {
    font-family: var(--font-display);
    font-size: 28px; letter-spacing: 3px;
    margin-bottom: 16px;
    margin-top: 32px;
  }

  .about-text p {
    color: var(--muted); line-height: 1.8;
    font-size: 14px; margin-bottom: 16px;
  }

  .social-links {
    display: flex; gap: 12px; margin-top: 32px;
  }

  .social-btn {
    display: flex; align-items: center; gap: 8px;
    padding: 12px 24px; border-radius: var(--radius);
    font-family: var(--font-mono); font-size: 11px;
    letter-spacing: 2px; text-transform: uppercase;
    cursor: pointer; transition: var(--transition);
    text-decoration: none;
  }

  .social-btn.instagram {
    background: linear-gradient(135deg, #f09433 0%, #e6683c 25%, #dc2743 50%, #cc2366 75%, #bc1888 100%);
    color: #fff; border: none;
  }
  .social-btn.instagram:hover { transform: translateY(-2px); box-shadow: 0 10px 30px rgba(220,39,67,0.4); }

  .social-btn.whatsapp {
    background: #25d366; color: #fff; border: none;
  }
  .social-btn.whatsapp:hover { transform: translateY(-2px); box-shadow: 0 10px 30px rgba(37,211,102,0.4); }

  /* REVIEWS */
  .reviews-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(260px, 1fr));
    gap: 16px;
  }

  .review-card {
    background: var(--surface);
    border: 1px solid var(--border);
    border-radius: 8px;
    overflow: hidden;
    transition: var(--transition);
    cursor: pointer;
  }
  .review-card:hover { border-color: rgba(200,255,0,0.4); transform: translateY(-4px); }

  .review-header {
    display: flex; align-items: center; gap: 10px;
    padding: 12px 16px;
    border-bottom: 1px solid var(--border);
  }

  .review-avatar {
    width: 36px; height: 36px; border-radius: 50%;
    background: linear-gradient(135deg, var(--neon2), var(--neon3));
    display: flex; align-items: center; justify-content: center;
    font-weight: 700; font-size: 14px; color: #000;
    flex-shrink: 0;
  }

  .review-username {
    font-weight: 600; font-size: 13px;
  }
  .review-handle {
    font-family: var(--font-mono); font-size: 10px; color: var(--muted);
  }

  .review-img {
    aspect-ratio: 1;
    background: var(--surface2);
    display: flex; align-items: center; justify-content: center;
    overflow: hidden;
  }

  .review-img img { width: 100%; height: 100%; object-fit: cover; }

  .review-body { padding: 12px 16px; }
  .review-stars { color: var(--neon); font-size: 12px; margin-bottom: 6px; }
  .review-text { font-size: 13px; color: var(--muted); line-height: 1.6; }

  /* CUSTOM DESIGN UPLOAD */
  .custom-section {
    background: linear-gradient(135deg, rgba(200,255,0,0.03) 0%, rgba(0,245,255,0.03) 100%);
    border: 1px solid rgba(200,255,0,0.1);
    border-radius: 8px;
    padding: 60px;
    text-align: center;
    max-width: 700px;
    margin: 0 auto;
  }

  .upload-zone {
    border: 2px dashed var(--border);
    border-radius: 8px;
    padding: 60px 40px;
    text-align: center;
    cursor: pointer;
    transition: var(--transition);
    margin: 32px 0;
  }
  .upload-zone:hover { border-color: var(--neon); background: rgba(200,255,0,0.02); }
  .upload-zone.dragover { border-color: var(--neon); background: rgba(200,255,0,0.05); }

  .upload-icon { font-size: 48px; margin-bottom: 16px; opacity: 0.5; }
  .upload-label { font-size: 14px; color: var(--muted); }

  .custom-form input, .custom-form textarea, .custom-form select {
    width: 100%;
    background: var(--surface);
    border: 1px solid var(--border);
    color: var(--text);
    padding: 14px 18px;
    font-family: var(--font-body);
    font-size: 14px;
    border-radius: var(--radius);
    margin-bottom: 12px;
    transition: var(--transition);
    appearance: none;
  }
  .custom-form input:focus, .custom-form textarea:focus, .custom-form select:focus {
    outline: none; border-color: var(--neon);
  }
  .custom-form textarea { resize: vertical; min-height: 100px; }

  /* MODAL PRODUCT */
  .modal-overlay {
    display: none;
    position: fixed; inset: 0;
    background: rgba(0,0,0,0.95);
    z-index: 200;
    align-items: center; justify-content: center;
    padding: 20px;
  }
  .modal-overlay.open { display: flex; }

  .modal {
    background: var(--surface);
    border: 1px solid var(--border);
    max-width: 900px; width: 100%;
    max-height: 90vh;
    overflow-y: auto;
    position: relative;
    animation: modalIn 0.4s cubic-bezier(0.16, 1, 0.3, 1);
  }
  @keyframes modalIn { from { opacity: 0; transform: scale(0.95) translateY(20px); } }

  .modal-close {
    position: absolute; top: 16px; right: 16px;
    background: none; border: 1px solid var(--border);
    color: var(--text); width: 36px; height: 36px;
    cursor: pointer; font-size: 18px;
    display: flex; align-items: center; justify-content: center;
    border-radius: var(--radius);
    transition: var(--transition); z-index: 1;
  }
  .modal-close:hover { border-color: var(--neon2); color: var(--neon2); }

  .modal-grid {
    display: grid; grid-template-columns: 1fr 1fr;
  }

  .modal-img {
    aspect-ratio: 1;
    background: var(--surface2);
    display: flex; align-items: center; justify-content: center;
  }

  .modal-details { padding: 40px; }
  .modal-details h2 {
    font-family: var(--font-display);
    font-size: 36px; letter-spacing: 3px;
    margin-bottom: 8px;
  }

  .modal-price {
    font-family: var(--font-mono);
    font-size: 22px; color: var(--neon);
    margin-bottom: 24px;
  }

  .modal-desc { color: var(--muted); font-size: 14px; line-height: 1.7; margin-bottom: 24px; }

  .size-label {
    font-family: var(--font-mono); font-size: 10px;
    letter-spacing: 3px; text-transform: uppercase;
    color: var(--muted); margin-bottom: 10px;
  }

  .size-grid {
    display: flex; gap: 8px; margin-bottom: 20px; flex-wrap: wrap;
  }

  .size-btn {
    padding: 8px 16px; border: 1px solid var(--border);
    background: none; color: var(--text);
    font-family: var(--font-mono); font-size: 11px;
    cursor: pointer; transition: var(--transition);
    border-radius: var(--radius);
  }
  .size-btn:hover { border-color: var(--neon); color: var(--neon); }
  .size-btn.active { background: var(--neon); color: #000; border-color: var(--neon); }

  .qty-control {
    display: flex; align-items: center; gap: 0;
    border: 1px solid var(--border); width: fit-content;
    margin-bottom: 24px; border-radius: var(--radius); overflow: hidden;
  }
  .qty-btn {
    background: none; border: none; color: var(--text);
    padding: 10px 18px; cursor: pointer;
    font-size: 18px; transition: var(--transition);
  }
  .qty-btn:hover { background: var(--surface2); color: var(--neon); }
  .qty-display {
    padding: 10px 20px;
    border-left: 1px solid var(--border);
    border-right: 1px solid var(--border);
    font-family: var(--font-mono); font-size: 14px;
  }

  /* CART SIDEBAR */
  .cart-sidebar {
    position: fixed; right: 0; top: 0; bottom: 0;
    width: 420px; background: var(--surface);
    border-left: 1px solid var(--border);
    z-index: 300; transform: translateX(100%);
    transition: transform 0.4s cubic-bezier(0.16, 1, 0.3, 1);
    display: flex; flex-direction: column;
    overflow: hidden;
  }
  .cart-sidebar.open { transform: translateX(0); }

  .cart-header {
    padding: 24px; border-bottom: 1px solid var(--border);
    display: flex; justify-content: space-between; align-items: center;
  }
  .cart-header h3 {
    font-family: var(--font-display); font-size: 24px; letter-spacing: 3px;
  }

  .cart-items { flex: 1; overflow-y: auto; padding: 16px; }

  .cart-item {
    display: flex; gap: 12px; padding: 16px 0;
    border-bottom: 1px solid var(--border);
    align-items: center;
  }

  .cart-item-img {
    width: 70px; height: 70px;
    background: var(--surface2);
    flex-shrink: 0;
    border: 1px solid var(--border);
    display: flex; align-items: center; justify-content: center;
    font-size: 24px;
  }

  .cart-item-info { flex: 1; }
  .cart-item-name { font-weight: 600; font-size: 13px; margin-bottom: 4px; }
  .cart-item-meta { font-family: var(--font-mono); font-size: 10px; color: var(--muted); }
  .cart-item-price { font-family: var(--font-mono); font-size: 13px; color: var(--neon); margin-top: 4px; }

  .cart-item-remove {
    background: none; border: none; color: var(--muted);
    cursor: pointer; font-size: 16px; transition: var(--transition);
    padding: 4px;
  }
  .cart-item-remove:hover { color: var(--neon2); }

  .cart-footer {
    padding: 24px; border-top: 1px solid var(--border);
  }

  .cart-total {
    display: flex; justify-content: space-between; align-items: center;
    margin-bottom: 16px;
  }
  .cart-total span:first-child {
    font-family: var(--font-mono); font-size: 11px; letter-spacing: 3px; color: var(--muted);
  }
  .cart-total span:last-child {
    font-family: var(--font-display); font-size: 28px; color: var(--neon);
  }

  /* CHECKOUT */
  #checkout {
    display: none;
    max-width: 700px; margin: 0 auto;
  }
  #checkout.active { display: block; }

  .checkout-form input, .checkout-form select {
    width: 100%;
    background: var(--surface);
    border: 1px solid var(--border);
    color: var(--text);
    padding: 14px 18px;
    font-family: var(--font-body); font-size: 14px;
    border-radius: var(--radius);
    margin-bottom: 12px;
    transition: var(--transition);
    appearance: none;
  }
  .checkout-form input:focus, .checkout-form select:focus {
    outline: none; border-color: var(--neon);
  }

  .checkout-section-title {
    font-family: var(--font-display);
    font-size: 24px; letter-spacing: 3px;
    margin-bottom: 20px; margin-top: 32px;
  }

  .payment-options {
    display: flex; gap: 12px; margin-bottom: 20px;
  }

  .payment-option {
    flex: 1; padding: 16px;
    border: 1px solid var(--border);
    background: none; color: var(--text);
    cursor: pointer; transition: var(--transition);
    font-family: var(--font-mono); font-size: 11px;
    letter-spacing: 2px; text-transform: uppercase;
    border-radius: var(--radius);
    text-align: center;
  }
  .payment-option:hover { border-color: var(--neon); }
  .payment-option.active { border-color: var(--neon); background: rgba(200,255,0,0.05); color: var(--neon); }

  /* ADMIN */
  #admin {
    display: none;
    min-height: 100vh;
    padding-top: 100px;
  }
  #admin.active { display: block; }

  .admin-grid {
    display: grid;
    grid-template-columns: 240px 1fr;
    gap: 0;
    min-height: calc(100vh - 100px);
  }

  .admin-sidebar {
    background: var(--surface);
    border-right: 1px solid var(--border);
    padding: 32px 0;
  }

  .admin-nav-item {
    display: flex; align-items: center; gap: 12px;
    padding: 14px 24px;
    cursor: pointer; transition: var(--transition);
    font-family: var(--font-mono); font-size: 11px;
    letter-spacing: 2px; text-transform: uppercase;
    color: var(--muted);
  }
  .admin-nav-item:hover { color: var(--neon); background: rgba(200,255,0,0.03); }
  .admin-nav-item.active { color: var(--neon); border-left: 2px solid var(--neon); background: rgba(200,255,0,0.05); }

  .admin-content { padding: 40px; }

  .admin-stats {
    display: grid; grid-template-columns: repeat(4, 1fr);
    gap: 16px; margin-bottom: 40px;
  }

  .stat-card {
    background: var(--surface);
    border: 1px solid var(--border);
    padding: 24px;
    border-radius: var(--radius);
  }
  .stat-card:hover { border-color: rgba(200,255,0,0.3); }

  .stat-value {
    font-family: var(--font-display);
    font-size: 36px; letter-spacing: 2px;
    color: var(--neon); margin-bottom: 4px;
  }
  .stat-label {
    font-family: var(--font-mono); font-size: 10px;
    letter-spacing: 3px; color: var(--muted);
    text-transform: uppercase;
  }

  .admin-table {
    width: 100%;
    border-collapse: collapse;
  }
  .admin-table th {
    padding: 12px 16px;
    font-family: var(--font-mono); font-size: 10px;
    letter-spacing: 3px; text-transform: uppercase;
    color: var(--muted);
    border-bottom: 1px solid var(--border);
    text-align: left;
  }
  .admin-table td {
    padding: 16px;
    border-bottom: 1px solid rgba(34,34,34,0.5);
    font-size: 13px;
  }
  .admin-table tr:hover td { background: rgba(200,255,0,0.02); }

  .status-badge {
    padding: 4px 10px; border-radius: 20px;
    font-family: var(--font-mono); font-size: 9px;
    letter-spacing: 2px; text-transform: uppercase; font-weight: 600;
  }
  .status-badge.pending { background: rgba(255,165,0,0.1); color: orange; }
  .status-badge.confirmed { background: rgba(200,255,0,0.1); color: var(--neon); }
  .status-badge.shipped { background: rgba(0,245,255,0.1); color: var(--neon3); }
  .status-badge.delivered { background: rgba(0,255,100,0.1); color: #00ff64; }

  .admin-section { display: none; }
  .admin-section.active { display: block; }

  /* LOGIN */
  .login-overlay {
    position: fixed; inset: 0;
    background: var(--bg);
    z-index: 500;
    display: flex; align-items: center; justify-content: center;
    flex-direction: column;
  }
  .login-overlay.hidden { display: none; }

  .login-box {
    background: var(--surface);
    border: 1px solid var(--border);
    padding: 60px;
    width: 400px;
    animation: fadeUp 0.5s ease;
  }

  .login-box h2 {
    font-family: var(--font-display);
    font-size: 40px; letter-spacing: 4px;
    margin-bottom: 8px;
  }
  .login-box p {
    font-family: var(--font-mono); font-size: 10px;
    color: var(--muted); letter-spacing: 3px; margin-bottom: 40px;
    text-transform: uppercase;
  }

  .login-box input {
    width: 100%;
    background: var(--surface2);
    border: 1px solid var(--border);
    color: var(--text);
    padding: 14px 18px;
    font-family: var(--font-body); font-size: 14px;
    border-radius: var(--radius);
    margin-bottom: 12px;
    transition: var(--transition);
  }
  .login-box input:focus { outline: none; border-color: var(--neon); }
  .login-error { color: var(--neon2); font-size: 12px; margin-bottom: 12px; font-family: var(--font-mono); display: none; }

  /* NOTIFICATIONS */
  .notification {
    position: fixed; bottom: 30px; right: 30px;
    background: var(--neon); color: #000;
    padding: 14px 24px;
    font-family: var(--font-mono); font-size: 11px;
    letter-spacing: 2px; text-transform: uppercase;
    border-radius: var(--radius); font-weight: 600;
    z-index: 999;
    animation: notifIn 0.3s ease, notifOut 0.3s ease 2.7s both;
    box-shadow: 0 10px 40px rgba(200,255,0,0.3);
  }
  @keyframes notifIn { from { opacity: 0; transform: translateY(20px); } }
  @keyframes notifOut { to { opacity: 0; transform: translateY(20px); } }

  /* ANIMATIONS */
  @keyframes fadeUp {
    from { opacity: 0; transform: translateY(30px); }
    to { opacity: 1; transform: translateY(0); }
  }

  .fade-in {
    opacity: 0; transform: translateY(30px);
    transition: opacity 0.7s ease, transform 0.7s ease;
  }
  .fade-in.visible { opacity: 1; transform: translateY(0); }

  /* FOOTER */
  footer {
    background: var(--surface);
    border-top: 1px solid var(--border);
    padding: 60px 40px 30px;
  }

  .footer-grid {
    display: grid;
    grid-template-columns: 2fr 1fr 1fr 1fr;
    gap: 60px;
    margin-bottom: 60px;
  }

  .footer-brand .logo { font-size: 40px; display: block; margin-bottom: 16px; }
  .footer-brand p { color: var(--muted); font-size: 13px; line-height: 1.7; }

  .footer-col h4 {
    font-family: var(--font-mono); font-size: 10px;
    letter-spacing: 4px; text-transform: uppercase;
    color: var(--muted); margin-bottom: 20px;
  }

  .footer-col ul { list-style: none; }
  .footer-col ul li {
    margin-bottom: 10px;
  }
  .footer-col ul li a {
    color: var(--muted); text-decoration: none;
    font-size: 13px; transition: var(--transition); cursor: pointer;
  }
  .footer-col ul li a:hover { color: var(--neon); }

  .footer-bottom {
    border-top: 1px solid var(--border);
    padding-top: 24px;
    display: flex; justify-content: space-between; align-items: center;
  }
  .footer-bottom p {
    font-family: var(--font-mono); font-size: 10px;
    letter-spacing: 2px; color: var(--muted);
  }

  /* SCROLLTOP */
  .scroll-top {
    position: fixed; bottom: 30px; left: 30px;
    background: var(--surface); border: 1px solid var(--border);
    color: var(--text); width: 44px; height: 44px;
    cursor: pointer; transition: var(--transition);
    font-size: 18px;
    display: flex; align-items: center; justify-content: center;
    border-radius: var(--radius); z-index: 90;
    opacity: 0; pointer-events: none;
  }
  .scroll-top.visible { opacity: 1; pointer-events: auto; }
  .scroll-top:hover { border-color: var(--neon); color: var(--neon); }

  /* CART OVERLAY */
  .cart-overlay {
    display: none; position: fixed; inset: 0;
    background: rgba(0,0,0,0.7); z-index: 250;
  }
  .cart-overlay.open { display: block; }

  /* FORM LABEL */
  .form-label {
    font-family: var(--font-mono); font-size: 10px;
    letter-spacing: 3px; text-transform: uppercase;
    color: var(--muted); display: block; margin-bottom: 6px;
  }

  .form-group { margin-bottom: 20px; }

  .divider {
    height: 1px; background: var(--border); margin: 60px 0;
  }

  /* Page sections */
  .page-section { display: block; }
  .page-section.hidden { display: none; }

  /* Upload preview */
  #design-preview {
    display: none;
    padding: 16px;
    background: var(--surface2);
    border: 1px solid var(--neon);
    border-radius: var(--radius);
    margin-bottom: 16px;
    font-family: var(--font-mono); font-size: 12px;
    color: var(--neon);
  }

  /* Add product form */
  .admin-product-grid {
    display: grid; grid-template-columns: 1fr 1fr;
    gap: 20px;
  }

  .input-field {
    width: 100%;
    background: var(--surface2);
    border: 1px solid var(--border);
    color: var(--text);
    padding: 14px 18px;
    font-family: var(--font-body); font-size: 14px;
    border-radius: var(--radius);
    transition: var(--transition);
  }
  .input-field:focus { outline: none; border-color: var(--neon); }
  .input-field::placeholder { color: var(--muted); }

  .color-palette-input { display: flex; gap: 8px; align-items: center; flex-wrap: wrap; margin-top: 8px; }

  .admin-order-status {
    background: var(--surface2); border: 1px solid var(--border);
    color: var(--text); padding: 6px 10px;
    font-family: var(--font-mono); font-size: 10px;
    border-radius: var(--radius); cursor: pointer;
  }

  /* Responsive */
  @media (max-width: 900px) {
    nav { padding: 16px 20px; }
    .nav-links { display: none; }
    section { padding: 60px 20px; }
    .about-grid { grid-template-columns: 1fr; gap: 40px; }
    .footer-grid { grid-template-columns: 1fr 1fr; gap: 40px; }
    .cart-sidebar { width: 100%; }
    .modal-grid { grid-template-columns: 1fr; }
    .admin-grid { grid-template-columns: 1fr; }
    .admin-sidebar { display: none; }
    .admin-stats { grid-template-columns: 1fr 1fr; }
    .login-box { width: calc(100% - 40px); padding: 40px 30px; }
    .custom-section { padding: 40px 24px; }
    .hero-ctas { flex-direction: column; align-items: center; }
  }
</style>
</head>
<body>

<div id="cursor"></div>

<!-- LOGIN OVERLAY (Admin) -->
<div class="login-overlay" id="adminLogin">
  <div style="text-align:center;margin-bottom:40px;">
    <div class="logo">OGDRIP</div>
    <div style="font-family:var(--font-mono);font-size:10px;letter-spacing:4px;color:var(--muted);margin-top:8px;text-transform:uppercase">Admin Portal</div>
  </div>
  <div class="login-box">
    <h2>LOGIN</h2>
    <p>Restricted Access</p>
    <label class="form-label">Username</label>
    <input type="text" id="adminUser" placeholder="admin" autocomplete="off">
    <label class="form-label">Password</label>
    <input type="password" id="adminPass" placeholder="••••••••">
    <p class="login-error" id="loginError">❌ Invalid credentials</p>
    <button class="btn-primary" style="width:100%;margin-top:8px;" onclick="adminLogin()">ENTER</button>
    <div style="text-align:center;margin-top:20px;">
      <a onclick="closeAdminLogin()" style="font-family:var(--font-mono);font-size:10px;color:var(--muted);cursor:pointer;letter-spacing:2px;">← BACK TO STORE</a>
    </div>
  </div>
</div>

<!-- NAV -->
<nav>
  <div class="logo" onclick="showPage('home')">OGDRIP</div>
  <ul class="nav-links">
    <li><a onclick="showPage('home')">Home</a></li>
    <li><a onclick="showPage('shop')">Shop</a></li>
    <li><a onclick="showPage('about')">About</a></li>
    <li><a onclick="showPage('custom')">Custom Order</a></li>
    <li><a onclick="goAdmin()">Admin</a></li>
  </ul>
  <div class="nav-actions">
    <button class="cart-btn" onclick="toggleCart()">
      🛒 Cart
      <span class="cart-count" id="cartCount">0</span>
    </button>
  </div>
</nav>

<!-- CART OVERLAY -->
<div class="cart-overlay" id="cartOverlay" onclick="toggleCart()"></div>

<!-- CART SIDEBAR -->
<div class="cart-sidebar" id="cartSidebar">
  <div class="cart-header">
    <h3>YOUR CART</h3>
    <button class="modal-close" onclick="toggleCart()">✕</button>
  </div>
  <div class="cart-items" id="cartItems">
    <div style="text-align:center;padding:60px 20px;color:var(--muted);">
      <div style="font-size:48px;margin-bottom:16px;">🛒</div>
      <div style="font-family:var(--font-mono);font-size:11px;letter-spacing:2px;">CART IS EMPTY</div>
    </div>
  </div>
  <div class="cart-footer">
    <div class="cart-total">
      <span>TOTAL</span>
      <span id="cartTotal">₹0</span>
    </div>
    <button class="btn-primary" style="width:100%;margin-bottom:10px;" onclick="proceedCheckout()">CHECKOUT →</button>
    <button class="btn-outline" style="width:100%;" onclick="toggleCart()">CONTINUE SHOPPING</button>
  </div>
</div>

<!-- ===== HOME PAGE ===== -->
<div id="page-home" class="page-section">
  <section id="home">
    <div class="hero-bg"></div>
    <div class="hero-grid"></div>
    <div class="hero-content">
      <div class="hero-eyebrow">✦ New Drop 2025 ✦</div>
      <h1 class="hero-title">
        <span>OG</span>
        <span class="accent">DRIP</span>
      </h1>
      <p class="hero-sub">Wear The Culture. Own The Streets.</p>
      <div class="hero-ctas">
        <button class="btn-primary" onclick="showPage('shop')">SHOP NOW →</button>
        <button class="btn-outline" onclick="showPage('custom')">CUSTOM ORDER</button>
      </div>
    </div>
  </section>

  <!-- TICKER -->
  <div class="ticker">
    <div class="ticker-inner" id="tickerInner">
      <span>NEW DROP</span><span>★</span>
      <span>STREETWEAR</span><span>★</span>
      <span>OGDRIP</span><span>★</span>
      <span>LIMITED EDITION</span><span>★</span>
      <span>CUSTOM ORDERS</span><span>★</span>
      <span>WEAR THE CULTURE</span><span>★</span>
      <span>NEW DROP</span><span>★</span>
      <span>STREETWEAR</span><span>★</span>
      <span>OGDRIP</span><span>★</span>
      <span>LIMITED EDITION</span><span>★</span>
      <span>CUSTOM ORDERS</span><span>★</span>
      <span>WEAR THE CULTURE</span><span>★</span>
    </div>
  </div>

  <!-- NEW DROPS FEATURED -->
  <section>
    <div class="section-label">/ New Drops</div>
    <h2 class="section-title fade-in">LATEST DROPS</h2>
    <div class="drops-grid" id="homeProducts"></div>
    <div style="text-align:center;margin-top:40px;">
      <button class="btn-outline" onclick="showPage('shop')">VIEW ALL DROPS →</button>
    </div>
  </section>

  <!-- REVIEWS SECTION -->
  <section style="background:var(--surface);border-top:1px solid var(--border);border-bottom:1px solid var(--border);">
    <div class="section-label">/ Community</div>
    <h2 class="section-title fade-in">THE DRIP WALL</h2>
    <div class="reviews-grid" id="reviewsGrid"></div>
  </section>

  <!-- CUSTOM ORDER CTA -->
  <section>
    <div class="custom-section fade-in">
      <div class="section-label" style="justify-content:center;display:flex;">&nbsp;/ Custom Orders</div>
      <h2 class="section-title" style="font-size:clamp(32px,5vw,60px);margin-bottom:16px;">YOUR DESIGN.<br>OUR CRAFT.</h2>
      <p style="color:var(--muted);font-size:14px;line-height:1.7;margin-bottom:32px;">Upload your artwork and we'll print it on premium streetwear. Full customization. No minimums on select items.</p>
      <button class="btn-primary" onclick="showPage('custom')">START YOUR CUSTOM ORDER →</button>
    </div>
  </section>
</div>

<!-- ===== SHOP PAGE ===== -->
<div id="page-shop" class="page-section hidden">
  <section style="padding-top:120px;">
    <div class="section-label">/ All Products</div>
    <h2 class="section-title">THE DROP</h2>

    <!-- Filters -->
    <div style="display:flex;gap:12px;margin-bottom:40px;flex-wrap:wrap;">
      <button class="filter-btn btn-primary" onclick="filterProducts('all')" id="filter-all">ALL</button>
      <button class="filter-btn btn-outline" onclick="filterProducts('tees')" id="filter-tees">TEES</button>
      <button class="filter-btn btn-outline" onclick="filterProducts('hoodies')" id="filter-hoodies">HOODIES</button>
      <button class="filter-btn btn-outline" onclick="filterProducts('caps')" id="filter-caps">CAPS</button>
      <button class="filter-btn btn-outline" onclick="filterProducts('accessories')" id="filter-accessories">ACCESSORIES</button>
    </div>

    <div class="drops-grid" id="shopProducts"></div>
    <div id="noProducts" style="display:none;text-align:center;padding:80px;color:var(--muted);">
      <div style="font-size:48px;margin-bottom:16px;">📦</div>
      <div style="font-family:var(--font-mono);font-size:11px;letter-spacing:2px;">NO PRODUCTS IN THIS CATEGORY YET</div>
    </div>
  </section>
</div>

<!-- ===== ABOUT PAGE ===== -->
<div id="page-about" class="page-section hidden">
  <section id="about" style="padding-top:120px;">
    <div class="about-grid">
      <div class="about-visual">
        <div class="about-box" style="height:500px;">
          <div style="text-align:center;z-index:1;">
            <div class="logo" style="font-size:80px;display:block;margin-bottom:16px;">OGDRIP</div>
            <div style="font-family:var(--font-mono);font-size:10px;letter-spacing:6px;color:var(--muted);">EST. 2025</div>
          </div>
        </div>
      </div>

      <div class="about-text">
        <div class="section-label">/ Our Story</div>
        <div class="about-accent-line"></div>
        <h2 class="section-title" style="margin-bottom:20px;font-size:clamp(36px,4vw,60px);">BORN FROM THE STREETS</h2>
        <p>OGDRIP was born in 2025 from a simple idea — streetwear shouldn't be for the privileged few. We wanted to build a brand that speaks to the culture, raw and unfiltered.</p>
        <p>From our first drop in a small studio to becoming one of the most talked-about streetwear labels, we've stayed true to what we are: authentic, bold, and unapologetically OG.</p>

        <h3>🎯 VISION</h3>
        <p>To become the defining streetwear brand of our generation — one that empowers individuals to wear their identity with confidence.</p>

        <h3>💡 MISSION</h3>
        <p>Create premium, accessible streetwear that blends artistic expression with everyday wearability. Every piece we drop is a statement.</p>

        <div class="social-links">
          <a href="https://instagram.com/ogdrip" target="_blank" class="social-btn instagram">
            📸 Instagram
          </a>
          <a href="https://wa.me/919999999999?text=Hey!%20I%20want%20to%20know%20more%20about%20OGDRIP" target="_blank" class="social-btn whatsapp">
            💬 WhatsApp
          </a>
        </div>
      </div>
    </div>

    <!-- Team / Values -->
    <div style="margin-top:80px;text-align:center;">
      <div class="section-label" style="justify-content:center;display:flex;">/ What We Stand For</div>
      <h2 class="section-title" style="margin-bottom:60px;">OUR VALUES</h2>
      <div style="display:grid;grid-template-columns:repeat(auto-fit,minmax(200px,1fr));gap:2px;">
        <div style="background:var(--surface);border:1px solid var(--border);padding:40px;text-align:center;transition:var(--transition);" onmouseover="this.style.borderColor='var(--neon)'" onmouseout="this.style.borderColor='var(--border)'">
          <div style="font-size:36px;margin-bottom:16px;">⚡</div>
          <h3 style="font-family:var(--font-display);letter-spacing:3px;margin-bottom:8px;">AUTHENTICITY</h3>
          <p style="color:var(--muted);font-size:13px;">No fake hype. Real culture.</p>
        </div>
        <div style="background:var(--surface);border:1px solid var(--border);padding:40px;text-align:center;transition:var(--transition);" onmouseover="this.style.borderColor='var(--neon)'" onmouseout="this.style.borderColor='var(--border)'">
          <div style="font-size:36px;margin-bottom:16px;">🔥</div>
          <h3 style="font-family:var(--font-display);letter-spacing:3px;margin-bottom:8px;">QUALITY</h3>
          <p style="color:var(--muted);font-size:13px;">Premium fabrics. Every drop.</p>
        </div>
        <div style="background:var(--surface);border:1px solid var(--border);padding:40px;text-align:center;transition:var(--transition);" onmouseover="this.style.borderColor='var(--neon)'" onmouseout="this.style.borderColor='var(--border)'">
          <div style="font-size:36px;margin-bottom:16px;">🎨</div>
          <h3 style="font-family:var(--font-display);letter-spacing:3px;margin-bottom:8px;">CREATIVITY</h3>
          <p style="color:var(--muted);font-size:13px;">Art meets streetwear.</p>
        </div>
        <div style="background:var(--surface);border:1px solid var(--border);padding:40px;text-align:center;transition:var(--transition);" onmouseover="this.style.borderColor='var(--neon)'" onmouseout="this.style.borderColor='var(--border)'">
          <div style="font-size:36px;margin-bottom:16px;">🌍</div>
          <h3 style="font-family:var(--font-display);letter-spacing:3px;margin-bottom:8px;">COMMUNITY</h3>
          <p style="color:var(--muted);font-size:13px;">Built for the streets, by the streets.</p>
        </div>
      </div>
    </div>
  </section>
</div>

<!-- ===== CUSTOM ORDER PAGE ===== -->
<div id="page-custom" class="page-section hidden">
  <section style="padding-top:120px;">
    <div class="section-label">/ Custom Orders</div>
    <h2 class="section-title">DESIGN YOUR DROP</h2>

    <div class="custom-section" style="max-width:800px;text-align:left;">
      <div class="form-group">
        <label class="form-label">Select Base Product</label>
        <select class="input-field" id="customProduct" style="width:100%;margin-bottom:0;">
          <option>White Classic Tee</option>
          <option>Black Oversized Tee</option>
          <option>Pullover Hoodie</option>
          <option>Zip-Up Hoodie</option>
          <option>Dad Cap</option>
        </select>
      </div>

      <div class="form-group">
        <label class="form-label">Select Size</label>
        <div class="size-grid">
          <button class="size-btn" onclick="selectCustomSize(this)">XS</button>
          <button class="size-btn active" onclick="selectCustomSize(this)">S</button>
          <button class="size-btn" onclick="selectCustomSize(this)">M</button>
          <button class="size-btn" onclick="selectCustomSize(this)">L</button>
          <button class="size-btn" onclick="selectCustomSize(this)">XL</button>
          <button class="size-btn" onclick="selectCustomSize(this)">XXL</button>
        </div>
      </div>

      <div class="form-group">
        <label class="form-label">Upload Your Design</label>
        <div class="upload-zone" id="uploadZone" onclick="document.getElementById('designFile').click()" ondragover="handleDragOver(event)" ondrop="handleDrop(event)">
          <div class="upload-icon">🎨</div>
          <p class="upload-label">Click to upload or drag & drop your design</p>
          <p style="font-family:var(--font-mono);font-size:10px;color:var(--muted);margin-top:8px;letter-spacing:2px;">PNG, JPG, SVG — Max 10MB</p>
        </div>
        <input type="file" id="designFile" accept="image/*" style="display:none" onchange="handleFileUpload(this)">
        <div id="design-preview">✓ Design uploaded: <span id="design-filename"></span></div>
      </div>

      <div class="form-group">
        <label class="form-label">Print Position</label>
        <select class="input-field" style="width:100%;margin-bottom:0;">
          <option>Front Center</option>
          <option>Back Center</option>
          <option>Left Chest</option>
          <option>Full Back</option>
          <option>Sleeve</option>
        </select>
      </div>

      <div class="form-group">
        <label class="form-label">Your Name</label>
        <input type="text" class="input-field" placeholder="Full name" id="customName">
      </div>

      <div class="form-group">
        <label class="form-label">Phone / WhatsApp</label>
        <input type="text" class="input-field" placeholder="+91 XXXXX XXXXX" id="customPhone">
      </div>

      <div class="form-group">
        <label class="form-label">Special Instructions</label>
        <textarea class="input-field" placeholder="Any specific notes about your design, placement, or color preferences..." style="min-height:120px;width:100%;" id="customNotes"></textarea>
      </div>

      <div style="display:flex;justify-content:space-between;align-items:center;padding:16px;background:var(--surface2);border:1px solid var(--border);border-radius:var(--radius);margin-bottom:24px;">
        <span style="font-family:var(--font-mono);font-size:11px;letter-spacing:2px;color:var(--muted);">ESTIMATED PRICE</span>
        <span style="font-family:var(--font-display);font-size:28px;color:var(--neon);">₹999+</span>
      </div>

      <button class="btn-primary" style="width:100%;" onclick="submitCustomOrder()">SUBMIT CUSTOM ORDER →</button>
    </div>
  </section>
</div>

<!-- ===== CHECKOUT PAGE ===== -->
<div id="page-checkout" class="page-section hidden">
  <section style="padding-top:120px;max-width:1100px;margin:0 auto;">
    <div class="section-label">/ Checkout</div>
    <h2 class="section-title">COMPLETE YOUR ORDER</h2>

    <div style="display:grid;grid-template-columns:1fr 380px;gap:40px;">
      <div class="checkout-form">
        <div class="checkout-section-title">SHIPPING INFO</div>
        <label class="form-label">Full Name</label>
        <input type="text" class="input-field" placeholder="Your full name" id="chkName" style="width:100%;margin-bottom:12px;">
        <label class="form-label">Phone</label>
        <input type="text" class="input-field" placeholder="+91 XXXXX XXXXX" id="chkPhone" style="width:100%;margin-bottom:12px;">
        <label class="form-label">Email</label>
        <input type="email" class="input-field" placeholder="your@email.com" id="chkEmail" style="width:100%;margin-bottom:12px;">
        <label class="form-label">Address</label>
        <input type="text" class="input-field" placeholder="Street address" id="chkAddr" style="width:100%;margin-bottom:12px;">
        <div style="display:grid;grid-template-columns:1fr 1fr;gap:12px;">
          <div>
            <label class="form-label">City</label>
            <input type="text" class="input-field" placeholder="City" style="width:100%;">
          </div>
          <div>
            <label class="form-label">PIN Code</label>
            <input type="text" class="input-field" placeholder="500001" style="width:100%;">
          </div>
        </div>

        <div class="checkout-section-title">PAYMENT</div>
        <div class="payment-options">
          <button class="payment-option active" onclick="selectPayment(this,'cod')">💵 Cash on Delivery</button>
          <button class="payment-option" onclick="selectPayment(this,'online')">📱 Online Payment</button>
          <button class="payment-option" onclick="selectPayment(this,'upi')">🏦 UPI</button>
        </div>

        <div id="upiSection" style="display:none;background:var(--surface2);border:1px solid var(--border);padding:20px;border-radius:var(--radius);margin-bottom:20px;text-align:center;">
          <div style="font-family:var(--font-display);font-size:24px;letter-spacing:3px;margin-bottom:8px;">UPI</div>
          <p style="font-family:var(--font-mono);font-size:12px;color:var(--neon);letter-spacing:2px;">ogdrip@upi</p>
          <p style="font-size:12px;color:var(--muted);margin-top:8px;">Pay and share screenshot on WhatsApp</p>
        </div>

        <button class="btn-primary" style="width:100%;" onclick="placeOrder()">PLACE ORDER →</button>
      </div>

      <!-- Order Summary -->
      <div>
        <div style="background:var(--surface);border:1px solid var(--border);padding:24px;position:sticky;top:100px;">
          <h3 style="font-family:var(--font-display);font-size:22px;letter-spacing:3px;margin-bottom:20px;border-bottom:1px solid var(--border);padding-bottom:16px;">ORDER SUMMARY</h3>
          <div id="checkoutItems" style="margin-bottom:20px;"></div>
          <div style="border-top:1px solid var(--border);padding-top:16px;">
            <div style="display:flex;justify-content:space-between;margin-bottom:8px;">
              <span style="font-family:var(--font-mono);font-size:11px;color:var(--muted);">SUBTOTAL</span>
              <span id="chkSubtotal" style="font-family:var(--font-mono);font-size:13px;">₹0</span>
            </div>
            <div style="display:flex;justify-content:space-between;margin-bottom:8px;">
              <span style="font-family:var(--font-mono);font-size:11px;color:var(--muted);">SHIPPING</span>
              <span style="font-family:var(--font-mono);font-size:13px;color:var(--neon);">FREE</span>
            </div>
            <div style="display:flex;justify-content:space-between;margin-top:16px;padding-top:16px;border-top:1px solid var(--border);">
              <span style="font-family:var(--font-mono);font-size:11px;letter-spacing:2px;">TOTAL</span>
              <span id="chkTotal" style="font-family:var(--font-display);font-size:28px;color:var(--neon);">₹0</span>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>
</div>

<!-- ===== ADMIN PAGE ===== -->
<div id="page-admin" class="page-section hidden">
  <div class="admin-grid" style="padding-top:80px;min-height:100vh;">
    <div class="admin-sidebar">
      <div style="padding:24px;border-bottom:1px solid var(--border);">
        <div class="logo" style="font-size:20px;">OGDRIP</div>
        <div style="font-family:var(--font-mono);font-size:9px;letter-spacing:3px;color:var(--muted);margin-top:4px;text-transform:uppercase">Admin Panel</div>
      </div>
      <div class="admin-nav-item active" onclick="adminSection('dashboard',this)">📊 Dashboard</div>
      <div class="admin-nav-item" onclick="adminSection('orders',this)">📦 Orders</div>
      <div class="admin-nav-item" onclick="adminSection('products',this)">👕 Products</div>
      <div class="admin-nav-item" onclick="adminSection('customOrders',this)">🎨 Custom Orders</div>
      <div class="admin-nav-item" onclick="adminSection('reviews',this)">⭐ Reviews</div>
      <div style="padding:24px;margin-top:auto;border-top:1px solid var(--border);">
        <button class="btn-outline" style="width:100%;font-size:10px;" onclick="adminLogout()">LOGOUT</button>
      </div>
    </div>

    <div class="admin-content">
      <!-- DASHBOARD -->
      <div class="admin-section active" id="admin-dashboard">
        <h2 style="font-family:var(--font-display);font-size:40px;letter-spacing:4px;margin-bottom:8px;">DASHBOARD</h2>
        <p style="font-family:var(--font-mono);font-size:10px;color:var(--muted);letter-spacing:3px;margin-bottom:40px;text-transform:uppercase;">Overview</p>
        <div class="admin-stats">
          <div class="stat-card"><div class="stat-value" id="statOrders">0</div><div class="stat-label">Total Orders</div></div>
          <div class="stat-card"><div class="stat-value" id="statRevenue">₹0</div><div class="stat-label">Revenue</div></div>
          <div class="stat-card"><div class="stat-value" id="statProducts">0</div><div class="stat-label">Products</div></div>
          <div class="stat-card"><div class="stat-value" id="statCustom">0</div><div class="stat-label">Custom Orders</div></div>
        </div>
        <h3 style="font-family:var(--font-display);font-size:24px;letter-spacing:3px;margin-bottom:20px;">RECENT ORDERS</h3>
        <div id="recentOrdersTable"></div>
      </div>

      <!-- ORDERS -->
      <div class="admin-section" id="admin-orders">
        <h2 style="font-family:var(--font-display);font-size:40px;letter-spacing:4px;margin-bottom:40px;">ALL ORDERS</h2>
        <div id="allOrdersTable"></div>
      </div>

      <!-- PRODUCTS -->
      <div class="admin-section" id="admin-products">
        <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:40px;">
          <h2 style="font-family:var(--font-display);font-size:40px;letter-spacing:4px;">PRODUCTS</h2>
          <button class="btn-primary" onclick="toggleAddProduct()">+ ADD PRODUCT</button>
        </div>

        <!-- Add Product Form -->
        <div id="addProductForm" style="display:none;background:var(--surface);border:1px solid var(--border);padding:32px;margin-bottom:32px;">
          <h3 style="font-family:var(--font-display);font-size:24px;letter-spacing:3px;margin-bottom:24px;">NEW PRODUCT</h3>
          <div class="admin-product-grid">
            <div>
              <label class="form-label">Product Name</label>
              <input type="text" class="input-field" placeholder="e.g. OG Classic Tee" id="pName" style="width:100%;margin-bottom:12px;">
              <label class="form-label">Price (₹)</label>
              <input type="number" class="input-field" placeholder="999" id="pPrice" style="width:100%;margin-bottom:12px;">
              <label class="form-label">Category</label>
              <select class="input-field" id="pCategory" style="width:100%;margin-bottom:12px;">
                <option value="tees">Tees</option>
                <option value="hoodies">Hoodies</option>
                <option value="caps">Caps</option>
                <option value="accessories">Accessories</option>
              </select>
              <label class="form-label">Badge (optional)</label>
              <select class="input-field" id="pBadge" style="width:100%;margin-bottom:12px;">
                <option value="">None</option>
                <option value="new">NEW</option>
                <option value="hot">🔥 HOT</option>
                <option value="limited">LIMITED</option>
              </select>
            </div>
            <div>
              <label class="form-label">Description</label>
              <textarea class="input-field" placeholder="Product description..." id="pDesc" style="width:100%;min-height:100px;margin-bottom:12px;"></textarea>
              <label class="form-label">Colors (comma separated hex)</label>
              <input type="text" class="input-field" placeholder="#ffffff, #000000, #c8ff00" id="pColors" style="width:100%;margin-bottom:12px;">
              <label class="form-label">Sizes Available</label>
              <input type="text" class="input-field" placeholder="XS, S, M, L, XL, XXL" id="pSizes" style="width:100%;margin-bottom:12px;">
              <label class="form-label">Product Emoji (placeholder)</label>
              <input type="text" class="input-field" placeholder="👕" id="pEmoji" style="width:100%;">
            </div>
          </div>
          <div style="display:flex;gap:12px;margin-top:20px;">
            <button class="btn-primary" onclick="addProduct()">ADD PRODUCT</button>
            <button class="btn-outline" onclick="toggleAddProduct()">CANCEL</button>
          </div>
        </div>

        <div id="adminProductsList"></div>
      </div>

      <!-- CUSTOM ORDERS -->
      <div class="admin-section" id="admin-customOrders">
        <h2 style="font-family:var(--font-display);font-size:40px;letter-spacing:4px;margin-bottom:40px;">CUSTOM ORDERS</h2>
        <div id="customOrdersTable"></div>
      </div>

      <!-- REVIEWS -->
      <div class="admin-section" id="admin-reviews">
        <div style="display:flex;justify-content:space-between;align-items:center;margin-bottom:40px;">
          <h2 style="font-family:var(--font-display);font-size:40px;letter-spacing:4px;">REVIEWS</h2>
          <button class="btn-primary" onclick="toggleAddReview()">+ ADD REVIEW</button>
        </div>

        <div id="addReviewForm" style="display:none;background:var(--surface);border:1px solid var(--border);padding:32px;margin-bottom:32px;">
          <h3 style="font-family:var(--font-display);font-size:24px;letter-spacing:3px;margin-bottom:24px;">NEW REVIEW</h3>
          <input type="text" class="input-field" placeholder="@username" id="rUsername" style="width:100%;margin-bottom:12px;">
          <input type="text" class="input-field" placeholder="Display name" id="rName" style="width:100%;margin-bottom:12px;">
          <textarea class="input-field" placeholder="Review text..." id="rText" style="width:100%;min-height:80px;margin-bottom:12px;"></textarea>
          <div style="display:flex;gap:12px;margin-bottom:12px;">
            <select class="input-field" id="rStars" style="width:auto;">
              <option value="5">★★★★★</option>
              <option value="4">★★★★☆</option>
              <option value="3">★★★☆☆</option>
            </select>
            <input type="text" class="input-field" placeholder="Emoji avatar (e.g. 😎)" id="rAvatar" style="flex:1;">
          </div>
          <div style="display:flex;gap:12px;">
            <button class="btn-primary" onclick="addReview()">ADD REVIEW</button>
            <button class="btn-outline" onclick="toggleAddReview()">CANCEL</button>
          </div>
        </div>

        <div id="adminReviewsList"></div>
      </div>
    </div>
  </div>
</div>

<!-- PRODUCT MODAL -->
<div class="modal-overlay" id="productModal">
  <div class="modal">
    <button class="modal-close" onclick="closeModal()">✕</button>
    <div class="modal-grid">
      <div class="modal-img" id="modalImg">
        <span style="font-size:120px;" id="modalEmoji">👕</span>
      </div>
      <div class="modal-details">
        <div class="section-label" id="modalCategory">/ Tees</div>
        <h2 id="modalName">Product Name</h2>
        <div class="modal-price" id="modalPrice">₹999</div>
        <p class="modal-desc" id="modalDesc">Description</p>

        <div class="size-label">SELECT SIZE</div>
        <div class="size-grid" id="modalSizes"></div>

        <div class="size-label" style="margin-top:16px;">QUANTITY</div>
        <div class="qty-control">
          <button class="qty-btn" onclick="changeQty(-1)">−</button>
          <span class="qty-display" id="qtyDisplay">1</span>
          <button class="qty-btn" onclick="changeQty(1)">+</button>
        </div>

        <button class="btn-primary" style="width:100%;" onclick="addToCartFromModal()">ADD TO CART →</button>
        <div style="margin-top:12px;display:flex;gap:8px;">
          <button class="btn-outline" style="flex:1;" onclick="buyNow()">BUY NOW</button>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- FOOTER -->
<footer id="mainFooter">
  <div class="footer-grid">
    <div class="footer-brand">
      <span class="logo">OGDRIP</span>
      <p>Wear The Culture. Own The Streets.<br>Premium streetwear for the next generation.</p>
      <div style="display:flex;gap:12px;margin-top:24px;">
        <a href="https://instagram.com/ogdrip" target="_blank" class="social-btn instagram" style="padding:10px 16px;font-size:10px;">📸 IG</a>
        <a href="https://wa.me/919999999999" target="_blank" class="social-btn whatsapp" style="padding:10px 16px;font-size:10px;">💬 WA</a>
      </div>
    </div>
    <div class="footer-col">
      <h4>Shop</h4>
      <ul>
        <li><a onclick="showPage('shop')">New Drops</a></li>
        <li><a onclick="filterProducts('tees');showPage('shop')">Tees</a></li>
        <li><a onclick="filterProducts('hoodies');showPage('shop')">Hoodies</a></li>
        <li><a onclick="filterProducts('caps');showPage('shop')">Caps</a></li>
      </ul>
    </div>
    <div class="footer-col">
      <h4>Info</h4>
      <ul>
        <li><a onclick="showPage('about')">About Us</a></li>
        <li><a onclick="showPage('custom')">Custom Orders</a></li>
        <li><a>Size Guide</a></li>
        <li><a>Shipping Info</a></li>
      </ul>
    </div>
    <div class="footer-col">
      <h4>Contact</h4>
      <ul>
        <li><a href="https://wa.me/919999999999" target="_blank">WhatsApp</a></li>
        <li><a href="https://instagram.com/ogdrip" target="_blank">Instagram DM</a></li>
        <li><a>Returns Policy</a></li>
        <li><a onclick="goAdmin()">Admin Login</a></li>
      </ul>
    </div>
  </div>
  <div class="footer-bottom">
    <p>© 2025 OGDRIP. All rights reserved.</p>
    <p>Made for the culture 🔥</p>
  </div>
</footer>

<button class="scroll-top" id="scrollTop" onclick="window.scrollTo({top:0,behavior:'smooth'})">↑</button>

<script>
// ===== STATE =====
let cart = [];
let products = [
  { id: 1, name: 'OG Classic Tee', price: 799, category: 'tees', desc: 'The staple of any wardrobe. 100% premium cotton, oversized fit, OGDRIP signature print.', colors: ['#ffffff', '#000000', '#c8ff00'], sizes: ['XS','S','M','L','XL','XXL'], badge: 'new', emoji: '👕' },
  { id: 2, name: 'Acid Wash Hoodie', price: 1499, category: 'hoodies', desc: 'Stone-washed premium fleece with dropped shoulders. For those who run cold on the inside.', colors: ['#333333', '#8b0000'], sizes: ['S','M','L','XL','XXL'], badge: 'hot', emoji: '🧥' },
  { id: 3, name: 'DRIP Cap', price: 599, category: 'caps', desc: 'Structured dad cap with embroidered OGDRIP logo. One size adjustable.', colors: ['#000000', '#ffffff', '#c8ff00'], sizes: ['ONE SIZE'], badge: '', emoji: '🧢' },
  { id: 4, name: 'OG Cargos', price: 1299, category: 'accessories', desc: 'Six-pocket cargo pants with custom hardware. Relaxed fit streetwear staple.', colors: ['#2d2d2d', '#4a3728'], sizes: ['S','M','L','XL'], badge: 'limited', emoji: '👖' },
  { id: 5, name: 'Neon Graphic Tee', price: 899, category: 'tees', desc: 'UV-reactive neon print on jet black. Glows under black light. Perfect for the night.', colors: ['#000000'], sizes: ['XS','S','M','L','XL','XXL'], badge: 'new', emoji: '🌟' },
  { id: 6, name: 'Street Zip Hoodie', price: 1699, category: 'hoodies', desc: 'Full zip fleece with hidden inner pockets. Built for movement, styled for the streets.', colors: ['#1a1a1a', '#c8ff00'], sizes: ['S','M','L','XL'], badge: '', emoji: '🧤' },
];
let reviews = [
  { id: 1, username: '@xaerastyle', name: 'Xaera', text: 'Bro the quality is INSANE 🔥 My fav fit rn', stars: 5, avatar: '😎' },
  { id: 2, username: '@streetkid.95', name: 'Dev', text: 'Got the acid wash hoodie. All my guys want one now lmao', stars: 5, avatar: '🔥' },
  { id: 3, username: '@neondrxp', name: 'Priya', text: 'Custom design came out perfect. Exactly what I wanted!', stars: 5, avatar: '✨' },
  { id: 4, username: '@og.collector', name: 'Aryan', text: 'Limited pieces hit different. Don\'t sleep on OGDRIP', stars: 5, avatar: '👑' },
  { id: 5, username: '@mxdstudio', name: 'Nisha', text: 'Clean, premium, and actually affordable. Rare combo', stars: 4, avatar: '🎨' },
  { id: 6, username: '@hypdrop', name: 'Kabir', text: 'The neon tee under UV lights?? SHEESH 🫡', stars: 5, avatar: '⚡' },
];
let orders = [];
let customOrders = [];
let currentProduct = null;
let currentQty = 1;
let selectedSize = '';
let currentFilter = 'all';
let isAdminLoggedIn = false;
let selectedPaymentMethod = 'cod';

// ===== CURSOR =====
const cursor = document.getElementById('cursor');
document.addEventListener('mousemove', e => {
  cursor.style.left = e.clientX + 'px';
  cursor.style.top = e.clientY + 'px';
});
document.querySelectorAll('button, a, .product-card, .review-card, .admin-nav-item').forEach(el => {
  el.addEventListener('mouseenter', () => cursor.classList.add('hover'));
  el.addEventListener('mouseleave', () => cursor.classList.remove('hover'));
});

// ===== SCROLL =====
window.addEventListener('scroll', () => {
  const scrollBtn = document.getElementById('scrollTop');
  scrollBtn.classList.toggle('visible', window.scrollY > 400);

  document.querySelectorAll('.fade-in').forEach(el => {
    const rect = el.getBoundingClientRect();
    if (rect.top < window.innerHeight - 100) el.classList.add('visible');
  });
});

// ===== PAGE ROUTING =====
function showPage(page) {
  document.querySelectorAll('.page-section').forEach(s => s.classList.add('hidden'));
  document.getElementById('page-' + page).classList.remove('hidden');
  document.getElementById('mainFooter').style.display = page === 'admin' ? 'none' : 'block';
  window.scrollTo(0, 0);

  if (page === 'shop') renderShopProducts();
  if (page === 'home') { renderHomeProducts(); renderReviews(); }
  if (page === 'checkout') renderCheckout();
}

// ===== RENDER PRODUCTS =====
function renderHomeProducts() {
  const container = document.getElementById('homeProducts');
  const featured = products.slice(0, 4);
  container.innerHTML = featured.map(p => productCardHTML(p)).join('');
}

function renderShopProducts() {
  const container = document.getElementById('shopProducts');
  const noP = document.getElementById('noProducts');
  const filtered = currentFilter === 'all' ? products : products.filter(p => p.category === currentFilter);

  if (filtered.length === 0) {
    container.innerHTML = '';
    noP.style.display = 'block';
  } else {
    noP.style.display = 'none';
    container.innerHTML = filtered.map(p => productCardHTML(p)).join('');
  }
}

function productCardHTML(p) {
  const badgeHtml = p.badge ? `<div class="badge ${p.badge === '🔥 HOT' || p.badge === 'hot' ? 'hot' : ''}">${p.badge.toUpperCase()}</div>` : '';
  const colorsHtml = p.colors.map((c, i) => `<div class="variant-dot ${i===0?'active':''}" style="background:${c};" onclick="event.stopPropagation()"></div>`).join('');
  return `
    <div class="product-card" onclick="openModal(${p.id})">
      <div class="product-img-wrap">
        ${badgeHtml}
        <div class="product-placeholder">
          <span class="placeholder-icon">${p.emoji || '👕'}</span>
          <span class="placeholder-text">OGDRIP</span>
        </div>
        <div class="card-actions">
          <button class="add-to-cart-quick" onclick="event.stopPropagation();quickAdd(${p.id})">+ ADD TO CART</button>
        </div>
      </div>
      <div class="product-info">
        <div class="product-name">${p.name}</div>
        <div class="product-price">₹${p.price.toLocaleString()}</div>
        <div class="product-variants">${colorsHtml}</div>
      </div>
    </div>
  `;
}

function filterProducts(cat) {
  currentFilter = cat;
  document.querySelectorAll('.filter-btn').forEach(b => {
    b.className = b.onclick.toString().includes(`'${cat}'`) ? 'filter-btn btn-primary' : 'filter-btn btn-outline';
  });
  renderShopProducts();
}

// ===== REVIEWS =====
function renderReviews() {
  const grid = document.getElementById('reviewsGrid');
  grid.innerHTML = reviews.map(r => `
    <div class="review-card">
      <div class="review-header">
        <div class="review-avatar">${r.avatar}</div>
        <div>
          <div class="review-username">${r.name}</div>
          <div class="review-handle">${r.username}</div>
        </div>
      </div>
      <div class="review-img">
        <div style="width:100%;height:100%;display:flex;align-items:center;justify-content:center;background:linear-gradient(135deg,rgba(200,255,0,0.05),rgba(0,245,255,0.05));font-size:60px;">${r.avatar}</div>
      </div>
      <div class="review-body">
        <div class="review-stars">${'★'.repeat(r.stars)}${'☆'.repeat(5-r.stars)}</div>
        <div class="review-text">${r.text}</div>
      </div>
    </div>
  `).join('');
}

// ===== MODAL =====
function openModal(id) {
  const p = products.find(x => x.id === id);
  if (!p) return;
  currentProduct = p;
  currentQty = 1;
  selectedSize = p.sizes[0];

  document.getElementById('modalName').textContent = p.name;
  document.getElementById('modalPrice').textContent = `₹${p.price.toLocaleString()}`;
  document.getElementById('modalDesc').textContent = p.desc;
  document.getElementById('modalCategory').textContent = `/ ${p.category}`;
  document.getElementById('modalEmoji').textContent = p.emoji || '👕';
  document.getElementById('qtyDisplay').textContent = 1;

  const sizesEl = document.getElementById('modalSizes');
  sizesEl.innerHTML = p.sizes.map((s, i) => `<button class="size-btn ${i===0?'active':''}" onclick="selectSize(this,'${s}')">${s}</button>`).join('');

  document.getElementById('productModal').classList.add('open');
  document.body.style.overflow = 'hidden';
}

function closeModal() {
  document.getElementById('productModal').classList.remove('open');
  document.body.style.overflow = '';
}

document.getElementById('productModal').addEventListener('click', function(e) {
  if (e.target === this) closeModal();
});

function selectSize(btn, size) {
  selectedSize = size;
  document.querySelectorAll('#modalSizes .size-btn').forEach(b => b.classList.remove('active'));
  btn.classList.add('active');
}

function changeQty(delta) {
  currentQty = Math.max(1, currentQty + delta);
  document.getElementById('qtyDisplay').textContent = currentQty;
}

function addToCartFromModal() {
  if (!currentProduct) return;
  addToCart(currentProduct, currentQty, selectedSize);
  closeModal();
}

function buyNow() {
  addToCartFromModal();
  proceedCheckout();
}

function quickAdd(id) {
  const p = products.find(x => x.id === id);
  if (p) addToCart(p, 1, p.sizes[0]);
}

// ===== CART =====
function addToCart(product, qty, size) {
  const existing = cart.find(i => i.id === product.id && i.size === size);
  if (existing) {
    existing.qty += qty;
  } else {
    cart.push({ ...product, qty, size });
  }
  updateCartUI();
  showNotification(`${product.name} added to cart!`);
}

function updateCartUI() {
  const count = cart.reduce((a, b) => a + b.qty, 0);
  document.getElementById('cartCount').textContent = count;

  const itemsEl = document.getElementById('cartItems');
  if (cart.length === 0) {
    itemsEl.innerHTML = `<div style="text-align:center;padding:60px 20px;color:var(--muted);">
      <div style="font-size:48px;margin-bottom:16px;">🛒</div>
      <div style="font-family:var(--font-mono);font-size:11px;letter-spacing:2px;">CART IS EMPTY</div>
    </div>`;
  } else {
    itemsEl.innerHTML = cart.map((item, i) => `
      <div class="cart-item">
        <div class="cart-item-img">${item.emoji || '👕'}</div>
        <div class="cart-item-info">
          <div class="cart-item-name">${item.name}</div>
          <div class="cart-item-meta">Size: ${item.size} | Qty: ${item.qty}</div>
          <div class="cart-item-price">₹${(item.price * item.qty).toLocaleString()}</div>
        </div>
        <button class="cart-item-remove" onclick="removeFromCart(${i})">✕</button>
      </div>
    `).join('');
  }

  const total = cart.reduce((a, b) => a + b.price * b.qty, 0);
  document.getElementById('cartTotal').textContent = `₹${total.toLocaleString()}`;
}

function removeFromCart(index) {
  cart.splice(index, 1);
  updateCartUI();
}

function toggleCart() {
  const sidebar = document.getElementById('cartSidebar');
  const overlay = document.getElementById('cartOverlay');
  sidebar.classList.toggle('open');
  overlay.classList.toggle('open');
  document.body.style.overflow = sidebar.classList.contains('open') ? 'hidden' : '';
}

function proceedCheckout() {
  if (cart.length === 0) { showNotification('Add items to cart first!'); return; }
  const sidebar = document.getElementById('cartSidebar');
  const overlay = document.getElementById('cartOverlay');
  sidebar.classList.remove('open');
  overlay.classList.remove('open');
  document.body.style.overflow = '';
  showPage('checkout');
}

function renderCheckout() {
  const itemsEl = document.getElementById('checkoutItems');
  itemsEl.innerHTML = cart.map(item => `
    <div style="display:flex;justify-content:space-between;margin-bottom:12px;font-size:13px;">
      <span>${item.emoji} ${item.name} × ${item.qty}</span>
      <span style="font-family:var(--font-mono);color:var(--neon);">₹${(item.price * item.qty).toLocaleString()}</span>
    </div>
  `).join('');
  const total = cart.reduce((a, b) => a + b.price * b.qty, 0);
  document.getElementById('chkSubtotal').textContent = `₹${total.toLocaleString()}`;
  document.getElementById('chkTotal').textContent = `₹${total.toLocaleString()}`;
}

function selectPayment(btn, method) {
  selectedPaymentMethod = method;
  document.querySelectorAll('.payment-option').forEach(b => b.classList.remove('active'));
  btn.classList.add('active');
  document.getElementById('upiSection').style.display = method === 'upi' ? 'block' : 'none';
}

function placeOrder() {
  const name = document.getElementById('chkName').value;
  const phone = document.getElementById('chkPhone').value;
  const addr = document.getElementById('chkAddr').value;

  if (!name || !phone || !addr) { showNotification('Please fill all required fields!'); return; }

  const order = {
    id: 'OGD' + Date.now().toString().slice(-6),
    name, phone, addr,
    items: [...cart],
    total: cart.reduce((a, b) => a + b.price * b.qty, 0),
    payment: selectedPaymentMethod,
    status: 'pending',
    date: new Date().toLocaleDateString('en-IN')
  };

  orders.push(order);
  cart = [];
  updateCartUI();
  showNotification('🎉 Order placed successfully!');
  setTimeout(() => showPage('home'), 1500);
}

// ===== CUSTOM ORDER =====
let customDesignFile = null;

function handleFileUpload(input) {
  const file = input.files[0];
  if (!file) return;
  customDesignFile = file;
  document.getElementById('design-preview').style.display = 'block';
  document.getElementById('design-filename').textContent = file.name;
  document.getElementById('uploadZone').style.borderColor = 'var(--neon)';
}

function handleDragOver(e) {
  e.preventDefault();
  document.getElementById('uploadZone').classList.add('dragover');
}

function handleDrop(e) {
  e.preventDefault();
  document.getElementById('uploadZone').classList.remove('dragover');
  const file = e.dataTransfer.files[0];
  if (file) {
    customDesignFile = file;
    document.getElementById('design-preview').style.display = 'block';
    document.getElementById('design-filename').textContent = file.name;
    document.getElementById('uploadZone').style.borderColor = 'var(--neon)';
  }
}

function selectCustomSize(btn) {
  document.querySelectorAll('#page-custom .size-btn').forEach(b => b.classList.remove('active'));
  btn.classList.add('active');
}

function submitCustomOrder() {
  const name = document.getElementById('customName').value;
  const phone = document.getElementById('customPhone').value;
  const product = document.getElementById('customProduct').value;
  const notes = document.getElementById('customNotes').value;

  if (!name || !phone) { showNotification('Please fill your name and phone!'); return; }
  if (!customDesignFile) { showNotification('Please upload your design!'); return; }

  customOrders.push({
    id: 'CO' + Date.now().toString().slice(-5),
    name, phone, product, notes,
    design: customDesignFile.name,
    status: 'pending',
    date: new Date().toLocaleDateString('en-IN')
  });

  document.getElementById('customName').value = '';
  document.getElementById('customPhone').value = '';
  document.getElementById('customNotes').value = '';
  document.getElementById('design-preview').style.display = 'none';
  customDesignFile = null;
  document.getElementById('uploadZone').style.borderColor = '';

  showNotification('🎨 Custom order submitted! We\'ll contact you on WhatsApp.');
  setTimeout(() => {
    window.open(`https://wa.me/919999999999?text=Hi! I just submitted a custom order for ${encodeURIComponent(product)}. Order ref: CO${Date.now().toString().slice(-5)}`, '_blank');
  }, 1000);
}

// ===== ADMIN =====
function goAdmin() {
  if (isAdminLoggedIn) {
    showPage('admin');
    loadAdminData();
  } else {
    document.getElementById('adminLogin').classList.remove('hidden');
  }
}

function adminLogin() {
  const user = document.getElementById('adminUser').value;
  const pass = document.getElementById('adminPass').value;

  if (user === 'admin' && pass === 'ogdrip2025') {
    isAdminLoggedIn = true;
    document.getElementById('adminLogin').classList.add('hidden');
    showPage('admin');
    loadAdminData();
  } else {
    document.getElementById('loginError').style.display = 'block';
    document.getElementById('adminPass').value = '';
  }
}

function closeAdminLogin() {
  document.getElementById('adminLogin').classList.add('hidden');
}

document.getElementById('adminPass').addEventListener('keypress', e => {
  if (e.key === 'Enter') adminLogin();
});

function adminLogout() {
  isAdminLoggedIn = false;
  showPage('home');
}

function adminSection(name, el) {
  document.querySelectorAll('.admin-section').forEach(s => s.classList.remove('active'));
  document.getElementById('admin-' + name).classList.add('active');
  document.querySelectorAll('.admin-nav-item').forEach(i => i.classList.remove('active'));
  el.classList.add('active');
  loadAdminData();
}

function loadAdminData() {
  const totalRevenue = orders.reduce((a, b) => a + b.total, 0);
  document.getElementById('statOrders').textContent = orders.length;
  document.getElementById('statRevenue').textContent = `₹${totalRevenue.toLocaleString()}`;
  document.getElementById('statProducts').textContent = products.length;
  document.getElementById('statCustom').textContent = customOrders.length;

  renderOrdersTable('recentOrdersTable', orders.slice(-5));
  renderOrdersTable('allOrdersTable', orders);
  renderAdminProducts();
  renderCustomOrdersTable();
  renderAdminReviews();
}

function renderOrdersTable(elId, data) {
  const el = document.getElementById(elId);
  if (!el) return;
  if (data.length === 0) {
    el.innerHTML = `<div style="text-align:center;padding:40px;color:var(--muted);font-family:var(--font-mono);font-size:11px;letter-spacing:2px;">NO ORDERS YET</div>`;
    return;
  }
  el.innerHTML = `
    <table class="admin-table">
      <thead>
        <tr>
          <th>Order ID</th><th>Customer</th><th>Items</th><th>Total</th><th>Payment</th><th>Status</th><th>Action</th>
        </tr>
      </thead>
      <tbody>
        ${data.map((o, i) => `
          <tr>
            <td><span style="font-family:var(--font-mono);color:var(--neon);font-size:12px;">${o.id}</span></td>
            <td>${o.name}<br><span style="font-family:var(--font-mono);font-size:10px;color:var(--muted);">${o.phone}</span></td>
            <td>${o.items.length} item(s)</td>
            <td style="font-family:var(--font-mono);color:var(--neon);">₹${o.total.toLocaleString()}</td>
            <td style="font-family:var(--font-mono);font-size:11px;text-transform:uppercase;">${o.payment}</td>
            <td><span class="status-badge ${o.status}">${o.status}</span></td>
            <td>
              <select class="admin-order-status" onchange="updateOrderStatus(${orders.indexOf(o)}, this.value)">
                <option ${o.status==='pending'?'selected':''}>pending</option>
                <option ${o.status==='confirmed'?'selected':''}>confirmed</option>
                <option ${o.status==='shipped'?'selected':''}>shipped</option>
                <option ${o.status==='delivered'?'selected':''}>delivered</option>
              </select>
            </td>
          </tr>
        `).join('')}
      </tbody>
    </table>
  `;
}

function updateOrderStatus(index, status) {
  orders[index].status = status;
  loadAdminData();
  showNotification('Order status updated!');
}

function renderAdminProducts() {
  const el = document.getElementById('adminProductsList');
  if (!el) return;
  el.innerHTML = `
    <table class="admin-table">
      <thead><tr><th>Product</th><th>Category</th><th>Price</th><th>Sizes</th><th>Action</th></tr></thead>
      <tbody>
        ${products.map((p, i) => `
          <tr>
            <td>${p.emoji} ${p.name}</td>
            <td style="text-transform:capitalize;">${p.category}</td>
            <td style="font-family:var(--font-mono);color:var(--neon);">₹${p.price.toLocaleString()}</td>
            <td style="font-family:var(--font-mono);font-size:11px;">${p.sizes.join(', ')}</td>
            <td><button onclick="deleteProduct(${i})" style="background:none;border:1px solid var(--border);color:var(--neon2);padding:6px 14px;font-family:var(--font-mono);font-size:10px;cursor:pointer;border-radius:var(--radius);">DELETE</button></td>
          </tr>
        `).join('')}
      </tbody>
    </table>
  `;
}

function toggleAddProduct() {
  const form = document.getElementById('addProductForm');
  form.style.display = form.style.display === 'none' ? 'block' : 'none';
}

function addProduct() {
  const name = document.getElementById('pName').value;
  const price = parseInt(document.getElementById('pPrice').value);
  const category = document.getElementById('pCategory').value;
  const desc = document.getElementById('pDesc').value;
  const badge = document.getElementById('pBadge').value;
  const emoji = document.getElementById('pEmoji').value || '👕';
  const colors = document.getElementById('pColors').value.split(',').map(c => c.trim()).filter(Boolean);
  const sizes = document.getElementById('pSizes').value.split(',').map(s => s.trim()).filter(Boolean);

  if (!name || !price || !desc) { showNotification('Fill in all required fields!'); return; }

  products.push({
    id: Date.now(),
    name, price, category, desc, badge, emoji,
    colors: colors.length ? colors : ['#ffffff'],
    sizes: sizes.length ? sizes : ['S','M','L','XL']
  });

  // Reset form
  ['pName','pPrice','pDesc','pColors','pSizes','pEmoji'].forEach(id => document.getElementById(id).value = '');
  toggleAddProduct();
  loadAdminData();
  showNotification('Product added successfully!');
}

function deleteProduct(index) {
  if (!confirm('Delete this product?')) return;
  products.splice(index, 1);
  loadAdminData();
  showNotification('Product deleted.');
}

function renderCustomOrdersTable() {
  const el = document.getElementById('customOrdersTable');
  if (!el) return;
  if (customOrders.length === 0) {
    el.innerHTML = `<div style="text-align:center;padding:40px;color:var(--muted);font-family:var(--font-mono);font-size:11px;letter-spacing:2px;">NO CUSTOM ORDERS YET</div>`;
    return;
  }
  el.innerHTML = `
    <table class="admin-table">
      <thead><tr><th>ID</th><th>Customer</th><th>Product</th><th>Design File</th><th>Notes</th><th>Status</th></tr></thead>
      <tbody>
        ${customOrders.map(o => `
          <tr>
            <td style="font-family:var(--font-mono);color:var(--neon);font-size:12px;">${o.id}</td>
            <td>${o.name}<br><span style="font-family:var(--font-mono);font-size:10px;color:var(--muted);">${o.phone}</span></td>
            <td>${o.product}</td>
            <td style="font-family:var(--font-mono);font-size:11px;color:var(--neon3);">🎨 ${o.design}</td>
            <td style="font-size:12px;color:var(--muted);max-width:200px;">${o.notes || '—'}</td>
            <td><span class="status-badge pending">pending</span></td>
          </tr>
        `).join('')}
      </tbody>
    </table>
  `;
}

function renderAdminReviews() {
  const el = document.getElementById('adminReviewsList');
  if (!el) return;
  el.innerHTML = `
    <table class="admin-table">
      <thead><tr><th>User</th><th>Review</th><th>Stars</th><th>Action</th></tr></thead>
      <tbody>
        ${reviews.map((r, i) => `
          <tr>
            <td>${r.avatar} ${r.name}<br><span style="font-family:var(--font-mono);font-size:10px;color:var(--muted);">${r.username}</span></td>
            <td style="font-size:13px;color:var(--muted);max-width:300px;">${r.text}</td>
            <td style="color:var(--neon);">${'★'.repeat(r.stars)}</td>
            <td><button onclick="deleteReview(${i})" style="background:none;border:1px solid var(--border);color:var(--neon2);padding:6px 14px;font-family:var(--font-mono);font-size:10px;cursor:pointer;border-radius:var(--radius);">DELETE</button></td>
          </tr>
        `).join('')}
      </tbody>
    </table>
  `;
}

function toggleAddReview() {
  const f = document.getElementById('addReviewForm');
  f.style.display = f.style.display === 'none' ? 'block' : 'none';
}

function addReview() {
  const username = document.getElementById('rUsername').value;
  const name = document.getElementById('rName').value;
  const text = document.getElementById('rText').value;
  const stars = parseInt(document.getElementById('rStars').value);
  const avatar = document.getElementById('rAvatar').value || '😊';

  if (!username || !name || !text) { showNotification('Fill all fields!'); return; }

  reviews.push({ id: Date.now(), username, name, text, stars, avatar });
  ['rUsername','rName','rText','rAvatar'].forEach(id => document.getElementById(id).value = '');
  toggleAddReview();
  loadAdminData();
  showNotification('Review added!');
}

function deleteReview(index) {
  reviews.splice(index, 1);
  loadAdminData();
  showNotification('Review deleted.');
}

// ===== NOTIFICATIONS =====
function showNotification(msg) {
  const existing = document.querySelector('.notification');
  if (existing) existing.remove();

  const n = document.createElement('div');
  n.className = 'notification';
  n.textContent = msg;
  document.body.appendChild(n);
  setTimeout(() => n.remove(), 3000);
}

// ===== INIT =====
renderHomeProducts();
renderReviews();

// Scroll-triggered animations
setTimeout(() => {
  document.querySelectorAll('.fade-in').forEach(el => {
    const rect = el.getBoundingClientRect();
    if (rect.top < window.innerHeight - 100) el.classList.add('visible');
  });
}, 100);
</script>
</body>
</html>
