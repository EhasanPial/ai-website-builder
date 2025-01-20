<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>{{.SiteName}}</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet"> 

    <!-- Font Awesome -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="/static/lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="/static/lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

    <!-- Bootstrap -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom Stylesheet -->
    <link href="/static/css/style.css" rel="stylesheet">
    <link href="/static/css/custom.css" rel="stylesheet">

    <style>
        :root {
            --primary-color: {{.PrimaryColor}};
            --secondary-color: {{.SecondaryColor}};
            --accent-color: {{.AccentColor}};
        }
    </style>
</head>

<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
        <div class="container">
            {{if eq .LogoPosition "left"}}
            <a class="navbar-brand" href="/">{{.SiteName}}</a>
            {{end}}
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav {{if eq .LogoPosition "center"}}mx-auto{{end}}{{if eq .LogoPosition "right"}}mr-auto{{end}}{{if eq .LogoPosition "left"}}ml-auto{{end}}">
                    <li class="nav-item">
                        <a class="nav-link" href="/">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/about">About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/rentals">Rentals</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="/contact">Contact</a>
                    </li>
                </ul>
            </div>
            {{if neq .LogoPosition "left"}}
            <a class="navbar-brand {{if eq .LogoPosition "center"}}mx-auto{{end}}" href="/">{{.SiteName}}</a>
            {{end}}
        </div>
    </nav>

    <!-- Hero Section -->
    <section id="hero" class="banner_w3lspvt">
        <div class="banner-img">
            <div class="slide-container">
                {{range $index, $image := .SliderImages}}
                <div class="slide-element-{{add $index 1}}">
                    <img src="{{$image}}" 
                         alt="Luxury Property View {{add $index 1}}" 
                         class="slide-image{{if eq $index 0}} active{{end}}"
                         onerror="this.src='data:image/svg+xml;base64,PHN2ZyB3aWR0aD0iMTAwJSIgaGVpZ2h0PSIxMDAlIiB4bWxucz0iaHR0cDovL3d3dy53My5vcmcvMjAwMC9zdmciPjxyZWN0IHdpZHRoPSIxMDAlIiBoZWlnaHQ9IjEwMCUiIGZpbGw9IiNlZWVlZWUiLz48dGV4dCB4PSI1MCUiIHk9IjUwJSIgZm9udC1mYW1pbHk9IkFyaWFsIiBmb250LXNpemU9IjI0IiBmaWxsPSIjOTk5IiB0ZXh0LWFuY2hvcj0ibWlkZGxlIiBkeT0iLjNlbSI+SW1hZ2UgTm90IEF2YWlsYWJsZTwvdGV4dD48L3N2Zz4='">
                </div>
                {{end}}
            </div>
        </div>
        <div class="container">
            <div class="w3layouts-banner-info">
                <h1 class="section_title">Find Your Perfect Vacation Rental</h1>
                <div class="property-search">
                    <div class="autocomplete-wrap input-wrap">
                        <span class="searchIcon">
                            <i class="fas fa-search"></i>
                        </span>
                        <input type="text" id="location-search" placeholder="Enter a location" class="autocomplete-input">
                        <span class="right-icon">
                            <i class="fas fa-times"></i>
                        </span>
                    </div>
                    <div class="datepicker-wrap input-wrap">
                        <input type="text" placeholder="Select Dates" id="date-picker" class="datepicker-input">
                        <span class="right-icon">
                            <i class="far fa-calendar-alt"></i>
                        </span>
                    </div>
                    <div class="input-wrap guest-input-container">
                        <input type="text" placeholder="Guests" readonly id="guest-input" class="auto-guest-input">
                        <span class="right-icon">
                            <i class="fas fa-user-friends"></i>
                        </span>
                        <div class="auto-guest-content">
                            <div class="guestWrap">
                                <p>Guests</p>
                                <div class="wrap-guest-input">
                                    <button type="button" class="auto-guest-nav decrease-btn">-</button>
                                    <span class="guestCount">0</span>
                                    <button type="button" class="auto-guest-nav increase-btn">+</button>
                                </div>
                            </div>
                            <div class="wrap-guest">
                                <button type="button" class="btn btn-link guests-clear-btn">Clear</button>
                                <button type="button" class="btn btn-primary guests-save-btn">Save</button>
                            </div>
                        </div>
                    </div>
                    <div class="btn-wrap">
                        <button type="button" class="search-submit-btn">Show Best Prices</button>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
    <script src="/static/lib/easing/easing.min.js"></script>
    <script src="/static/lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="/static/lib/tempusdominus/js/moment.min.js"></script>
    <script src="/static/lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="/static/lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Custom Javascript -->
    <script>
        // Image Slider
        let currentSlide = 0;
        const slides = document.querySelectorAll('.slide-image');
        
        function showSlide(index) {
            slides.forEach(slide => slide.classList.remove('active'));
            currentSlide = (index + slides.length) % slides.length;
            slides[currentSlide].classList.add('active');
        }

        function nextSlide() {
            showSlide(currentSlide + 1);
        }

        // Change slide every 5 seconds
        setInterval(nextSlide, 5000);

        // Navbar scroll effect
        $(window).scroll(function() {
            if ($(this).scrollTop() > 50) {
                $('.navbar').addClass('scrolled');
            } else {
                $('.navbar').removeClass('scrolled');
            }
        });

        // Guest selector
        const guestInput = document.getElementById('guest-input');
        const guestContent = document.querySelector('.auto-guest-content');
        const guestCount = document.querySelector('.guestCount');
        const decreaseBtn = document.querySelector('.decrease-btn');
        const increaseBtn = document.querySelector('.increase-btn');
        const clearBtn = document.querySelector('.guests-clear-btn');
        const saveBtn = document.querySelector('.guests-save-btn');

        guestInput.addEventListener('click', () => {
            guestContent.style.display = 'block';
        });

        document.addEventListener('click', (e) => {
            if (!e.target.closest('.guest-input-container')) {
                guestContent.style.display = 'none';
            }
        });

        decreaseBtn.addEventListener('click', () => {
            let count = parseInt(guestCount.textContent);
            if (count > 0) {
                guestCount.textContent = count - 1;
            }
        });

        increaseBtn.addEventListener('click', () => {
            let count = parseInt(guestCount.textContent);
            guestCount.textContent = count + 1;
        });

        clearBtn.addEventListener('click', () => {
            guestCount.textContent = '0';
            guestInput.value = '';
        });

        saveBtn.addEventListener('click', () => {
            const count = guestCount.textContent;
            guestInput.value = count + ' Guest' + (count !== '1' ? 's' : '');
            guestContent.style.display = 'none';
        });

        // Initialize date picker
        $('#date-picker').daterangepicker({
            opens: 'center',
            autoUpdateInput: false,
            locale: {
                cancelLabel: 'Clear'
            }
        });

        $('#date-picker').on('apply.daterangepicker', function(ev, picker) {
            $(this).val(picker.startDate.format('MM/DD/YYYY') + ' - ' + picker.endDate.format('MM/DD/YYYY'));
        });

        $('#date-picker').on('cancel.daterangepicker', function(ev, picker) {
            $(this).val('');
        });
    </script>
</body>
</html>