document.addEventListener('DOMContentLoaded', function() {
    var navbar = document.querySelector('.navbar-custom');
    if (navbar) {
        window.addEventListener('scroll', function() {
            if (window.scrollY > 50) {
                navbar.style.boxShadow = '0 10px 30px rgba(0,0,0,0.05)';
                navbar.style.padding = '0.5rem 0';
            } else {
                navbar.style.boxShadow = 'none';
                navbar.style.padding = '1rem 0';
            }
        });
    }
});
