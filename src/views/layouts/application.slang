doctype html
html
  head
    title Reddit using Amber
    meta charset="utf-8"
    meta http-equiv="X-UA-Compatible" content="IE=edge"
    meta name="viewport" content="width=device-width, initial-scale=1"
    link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
    link rel="stylesheet" href="/dist/main.bundle.css"
    link rel="apple-touch-icon" href="/favicon.png"
    link rel="icon" href="/favicon.png"
    link rel="icon" type="image/x-icon" href="/favicon.ico"

  body
    header.navbar.navbar-expand-lg.navbar-light.bg-light
      .container
        #logo.navbar-brand == link_to("Raddit", "/")
        nav.collapse.navbar-collapse
          ul.nav.navbar-nav.ml-auto
            == render(partial: "layouts/_nav.slang")
    #main-content.container
      .row
        .col-sm
          - flash.each do |key, value|
            div class="alert alert-#{key}"
              p = flash[key]
      .row
        #content.col-sm-12.main
          == content

    script src="https://code.jquery.com/jquery-3.3.1.min.js"
    script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"
    script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"
    script src="/dist/main.bundle.js"
