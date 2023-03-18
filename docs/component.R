argon_page <- function(
    ..., 
    title = NULL, 
    description = NULL, 
    author = NULL, 
    navbar = NULL, 
    footer = NULL, 
    favicon = NULL,
    analytics = NULL
) {
  
  htmltools::tags$html(
    # head: need to use takeHeads from htmltools to extract all head elements
    argonR:::takeHeads(
      htmltools::tags$head(
        htmltools::tags$meta(charset = "utf-8"),
        htmltools::tags$meta(
          name = "viewport",
          content = "width=device-width, initial-scale=1, shrink-to-fit=no"
        ),
        htmltools::tags$meta(name = "description", content = description),
        htmltools::tags$meta(name = "author", content = author),
        htmltools::tags$title(title),
        
        # web dependencies CSS
        if (!is.null(favicon)) {
          htmltools::tags$link(href = paste0("inst/images/", favicon), rel = "icon", type = "image/png")
        },
        htmltools::tags$link(href = "https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600&display=swap", rel = "stylesheet"),
        htmltools::tags$link(href = "inst/assets/vendor/nucleo/css/nucleo.css", rel = "stylesheet"),
        htmltools::tags$link(href = "inst/assets/vendor/fontawesome/css/fontawesome.min.css", rel = "stylesheet"),
        htmltools::tags$link(href = "inst/assets/vendor/fontawesome/css/all.min.css", rel = "stylesheet"),
        htmltools::tags$link(type = "text/css", href = "inst/assets/css/argon.min.css", rel = "stylesheet"),
        htmltools::tags$link(type = "text/css", href = "inst/assets/css/custom.css", rel = "stylesheet"),
        
        # add analytic scripts if any
        if (!is.null(analytics)) analytics
        
      )
    ),
    
    # Body ------------------------------------------------------------->
    htmltools::tags$body(
      htmltools::tags$header(class = "header-global", navbar),
      tags$main(...),
      footer,
      
      # Core -->
      htmltools::tags$script(src = "inst/assets/vendor/jquery/jquery.min.js"),
      htmltools::tags$script(src = "inst/assets/vendor/popper/popper.min.js"),
      htmltools::tags$script(src = "inst/assets/vendor/bootstrap/bootstrap.min.js"),
      htmltools::tags$script(src = "inst/assets/vendor/headroom/headroom.min.js"),
      # Optional JS -->
      htmltools::tags$script(src = "inst/assets/vendor/onscreen/onscreen.min.js"),
      #htmltools::includeScript(path = "./assets/vendor/nouislider/js/nouislider.min.js"),
      
      # Argon JS -->
      htmltools::tags$script(src = "inst/assets/js/argon.min.js"),
      # Custom JS --->
      htmltools::tags$script(src = "inst/assets/js/main.js")
    )
  )
  
}


navbar <- function (
    ..., 
    href = "#", 
    src = NULL, 
    src_collapsed = NULL, 
    id, 
    headroom = TRUE
) {
  
  navBrand <- htmltools::tags$a(
    class = "navbar-brand mr-lg-5", 
    href = href, 
    
    htmltools::tags$img(src = src)
  )
  
  
  navbarToggler <- htmltools::tags$button(
    class = "navbar-toggler collapsed", 
    type = "button", 
    `data-toggle` = "collapse", 
    `data-target` = paste0("#", id), 
    `aria-controls` = id, 
    `aria-expanded` = "false", 
    `aria-label` = "Toggle navigation", 
    
    # htmltools::tags$span(class = "navbar-toggler-icon")
    htmltools::tags$i(class = "fa-solid fa-bars navbar__toggler-icon")
  )
  
  
  navbarCollapse <- htmltools::div(
    class = "navbar-collapse collapse collapse__bg", 
    id = id, 
    style = NA, 
    
    htmltools::div(
      class = "navbar-collapse-header", 
      
      htmltools::div(
        class = "row", 
        
        htmltools::div(
          class = "col-6 collapse-brand",
          
          htmltools::tags$a(
            href = href, 
            htmltools::tags$img(src = src_collapsed)
          )
        ), 
        
        htmltools::div(
          class = "col-6 collapse-close", 
          
          htmltools::tags$button(
            type = "button", 
            class = "navbar-toggler", 
            `data-toggle` = "collapse", 
            `data-target` = paste0("#", id), 
            `aria-controls` = id, 
            `aria-expanded` = "false", 
            `aria-label` = "Toggle navigation", 
            htmltools::tags$span(class = "navbar__toggler-close"), 
            htmltools::tags$span(class = "navbar__toggler-close")
          )
        )
      )
    ),
    ...
  )
  
  
  htmltools::tags$nav(
    class = paste0(
      "navbar navbar-main navbar-expand-lg navbar-transparent navbar-light", 
      if (headroom) 
        " headroom headroom--not-bottom headroom--pinned headroom--top"
    ), 
    
    id = "navbar-main", 
    
    htmltools::div(
      class = "container",
      navBrand, 
      navbarToggler, 
      navbarCollapse
    )
  )
}


argon_nav_item <- function (name = NULL, src = NULL, icon = NULL) {
  
  htmltools::tags$li(
    
    class = "nav-item", 
    
    htmltools::tags$a(
      class = "nav-link nav-link-icon edit-item", 
      href = src, 
      icon,
      htmltools::tags$span(
        class = "nav__link-dark",
        name
      )
    )
  )
}


fa_icon <- function(name, type = "brands", other_class = "") {
  
  htmltools::tags$i(class = glue::glue("fa-{type} fa-{name} {other_class}"))
  
}


link_icon <- function(link, icon, class = "", ...) {
  htmltools::a(
    href = link,
    target = "_blank",
    class = class,
    fa_icon(name = icon, ...)
  )
}


section <- function(..., id, size) {
  htmltools::tags$section(
    class = glue::glue("section section-{size} section__bg"),
    
    htmltools::div(
      class = "container",
      id = id,
      ...
    )
  )
}


theme_toggle_button <- function() {
  htmltools::tags$input(
    type = "checkbox",
    class = "theme__toggle",
    id = "theme-toggle",
    
    htmltools::tags$label(
      `for` = "theme-toggle",
      class = "theme__toggle-label",
      
      htmltools::tags$i(class = "fa-solid fa-moon"),
      htmltools::tags$i(class = "fa-solid fa-sun"),
      htmltools::span(class = "theme__toggle-ball")
    )
  )
}


page_path_button <- function(text, icon = NULL, page_href) {
  htmltools::a(
    href = page_href,
    class = "btn btn-bg", 
    
    htmltools::span(class = "btn-inner--text", text),
    htmltools::span(class = "btn-inner--icon", icon)
  )
}


download_cv_button <- function() {
  htmltools::a(
    download = "",
    href = "inst/assets/pdf/ayomide-cv.pdf",
    class = "btn btn-bg", #btn-default
    
    htmltools::span(class = "btn-inner--text", "Download CV"),
    htmltools::span(class = "btn-inner--icon", fa_icon("download", "solid"))
  )
}


portfolio_footer <- function() {
  htmltools::tags$footer(
    class = "footer footer__bg",
    id = "contact",
    
    argonR::argonContainer(
      size = "lg",
      
      argonR::argonRow(
        argonR::argonColumn(
          width = 12,
          
          h3(class = "segment__title-footer", "Contact")
        )
      ),
      
      argonR::argonRow(
        argonR::argonColumn(
          width = 4,

          h5(class = "footer__title", "Go To:"),
          
          htmltools::div(
            class = "footer-col",
            htmltools::tags$ul(
              class = "ts-text",
              
              htmltools::tags$li(
                htmltools::a(href = "#service", "Service")
              ),
              htmltools::tags$li(
                htmltools::a(href = "#portfolio", "Portfolio")
              ),
              htmltools::tags$li(
                htmltools::a(href = "#contact", "Contact")
              ),
              htmltools::tags$li(
                htmltools::a(href = "#", "Blog")
              )
            )
          )
        ),
        
        argonR::argonColumn(
          width = 4,
          
          h5(class = "footer__title", "Get in touch"),
          
          htmltools::div(
            class = "footer-col",
            
            htmltools::div(
              class = "ct-links",
              
              htmltools::tags$ul(
                class = "ul-s",
                
                htmltools::tags$li(
                  htmltools::tags$a(
                    href = "mailto:akinwandeayomide24@gmail.com",
                    htmltools::tags$i(class = "fa-solid fa-envelope")
                  )
                ),
                htmltools::tags$li(
                  htmltools::tags$a(
                    href = "https://wa.me/+2348099356268/",
                    htmltools::tags$i(class = "fa-brands fa-whatsapp") 
                  )
                ),
                htmltools::tags$li(
                  htmltools::tags$a(
                    href = "https://t.me/Ay_Akins",
                    htmltools::tags$i(class = "fa-brands fa-telegram") 
                  )
                )
              )
            )
          )
        ),
        
        argonR::argonColumn(
          width = 4,
          
          h5(class = "footer__title", "Follow Me"),
          
          htmltools::div(
            class = "footer-col",
            
            htmltools::div(
              class = "ct-links",
              
              htmltools::tags$ul(
                class = "ul-s",
                
                htmltools::tags$li(
                  htmltools::tags$a(
                    href = "https://twitter.com/Akinwande_ay24?s=09",
                    htmltools::tags$i(class = "fa-brands fa-twitter") 
                  )
                ),
                htmltools::tags$li(
                  htmltools::tags$a(
                    href = "https://www.linkedin.com/in/akinwande-ayomide-7bb37a199",
                    htmltools::tags$i(class = "fa-brands fa-linkedin-in") 
                  )
                ),
                htmltools::tags$li(
                  htmltools::tags$a(
                    href = "https://www.facebook.com/ayomide.akinwande.1",
                    htmltools::tags$i(class = "fa-brands fa-facebook-f") 
                  )
                )
              )
            )
          )
        )
      )
    )
  )
}


scroll_up_button <- function() {
  htmltools::a(
    href = "#",
    id = "scroll-up",
    class = "scroll_up",
    # fa_icon("arrow-up", "solid", other_class = "scroll__up-icon")
    argonIcon("bold-up")
  )
}


badge <- function(text) {
  htmltools::span(class = "skill__badge", text)
}


modal_button <- function(modal_id) {
  htmltools::tags$div(
    class = "service__modal-button",
    `data-toggle` = "modal",
    `data-target` = glue::glue("#{modal_id}"),
    htmltools::span(class = "service__modal-button-text", "View more"),
    fa_icon("arrow-right", "solid", other_class = "service__modal-button-icon")
  )
}


serviceCard <- function(...) {
  argonR::argonColumn(
    width = 12,
    
    htmltools::div(
      class = "card my-3 border-0 card-bg",
      
      htmltools::div(
        class = "card-body",
        htmltools::p(
          class = "description"
        ),
        ...
      )
    )
  )
}


serviceModal <- function(..., id, title) {
  
  tag_id <- glue::glue("{id}Label")
  
  htmltools::div(
    class = "modal fade",
    id = id,
    tabindex = "-1",
    role = "dialog",
    `aria-labelledby` = tag_id,
    `aria-hidden` = "true",
    
    htmltools::div(
      class = "modal-dialog modal-dialog-centered",
      role = "document",
      
      htmltools::div(
        class = "modal-content modal__bg",
        
        htmltools::div(
          class = "modal__header",
          
          htmltools::h5(
            class = "modal-title modal__header-text",
            id = tag_id,
            
            title
          ),
          
          htmltools::tags$button(
            type = "button", 
            class = "close", 
            `data-dismiss` = "modal", 
            `aria-label` = "Close",
            
            htmltools::span(
              `aria-hidden` = "true", 
              class = "modal__header-close", 
              "x"
            )
          )
        ),
        
        htmltools::div(class = "modal-body", ...)
      )
    )
  )
}


service_list_item <- function(text) {
  htmltools::tags$li(
    class = "services__modal-service",
    fa_icon(
      "circle-check", 
      "regular", 
      other_class = "services__modal-content-icon"
    ),
    htmltools::p(text)
  )
}


portfolio <- function(
    active = FALSE, 
    img_src, 
    title,
    description,
    tools_used,
    more_text = FALSE,
    project_src = "www.shinyio.com",
    code_src = "www.github.com"
    ) {
  
  is_active <- ifelse(active, "active", "")
  is_more_text <- ifelse(more_text, "more-text", "")
  
  htmltools::div(
    class = glue::glue("carousel-item {is_active} embed-responsive-item"),
    
    div(
      class = "portfolio__content",
      
      htmltools::img(src = img_src, class = "portfolio__img"), #img-fluid
      
      htmltools::div(
        class = "portfolio__description",
        
        div(
          class = "portfolio__description-text-view",
          
          div(
            class = glue::glue("portfolio__description-text {is_more_text}"),
            h4(class = "portfolio__title", title),
            description
          ),
          
          htmltools::a(
            class = "portfolio__view-button",
            href = project_src,
            htmltools::span(class = "portfolio__modal-button-text", "View"),
            fa_icon("arrow-right", "solid", other_class = "portfolio__view-button-icon")
          )
        ),
        
        div(
          class = "portfolio__description-tools-git",
          
          div(
            class = "portfolio__description-tools",
            
            h5(class = "portfolio__description-tools-title","Tools:"),
            
            div(
              class = "portfolio__description-framework",
              
              lapply(seq_len(length(tools_used)), \(t) {
                span(class = "portfolio__description-badge", tools_used[t])
              })
            )
          ),
          
          htmltools::a(
            class = "portfolio__code-link",
            
            href = code_src,
            fa_icon("github", "brands", other_class = "shadow portfolio__git-link")
          )
        )
      )
    )
  )
}


carousel <- function (..., id, width = 6) {
  carouselCl <- "rounded overflow-hidden"
  
  carouselItems <- list(...)
  
  len <- length(carouselItems)
  
  found_active <- FALSE
  
  carouselNavItems <- lapply(X = 1:len, FUN = function(i) {
    
    currentItem <- carouselItems[[i]]
    
    currentItemCl <- currentItem$attribs$class
    
    if (!found_active) {
      active <- sum(grep(x = currentItemCl, pattern = "active")) == 1
      
      if (active) found_active <<- TRUE
      
    } else {
      active <- FALSE
    }
    
    htmltools::tags$li(
      `data-target` = paste0("#", id), 
      `data-slide-to` = paste0(i - 1), 
      class = if (active) "active" else NA
    )
  })
  
  carouselNav <- htmltools::tags$ol(
    class = "carousel-indicators", 
    carouselNavItems
  )
  
  carouselContent <- htmltools::div(
    class = "carousel-inner embed-responsive embed-responsive-4by3 visible-body", 
    ...
  )
  
  carouselControls <- htmltools::tagList(
    htmltools::tags$a(
      class = "carousel-control-prev", 
      href = paste0("#", id), 
      role = "button", 
      `data-slide` = "prev", 
      
      # htmltools::span(
      #   class = "carousel-control-prev-icon", 
      #   `aria-hidden` = "true"
      # ), 
      htmltools::tags$i(
        class = "fa-solid fa-chevron-left next_prev__icon",
        `aria-hidden` = "true"
      ),
      
      htmltools::span(class = "sr-only", "Previous")
    ), 
    
    htmltools::a(
      class = "carousel-control-next", 
      href = paste0("#", id), 
      role = "button", 
      `data-slide` = "next", 
      
      # htmltools::span(
      #   class = "carousel-control-next-icon", 
      #   `aria-hidden` = "true"
      # ), 
      htmltools::tags$i(
        class = "fa-solid fa-chevron-right next_prev__icon",
        `aria-hidden` = "true"
      ),
      
      htmltools::span(class = "sr-only", "Next")
    )
  )
  
  carouselTag <- htmltools::div(
    class = carouselCl, 
    
    htmltools::div(
      class = "carousel slide", 
      id = id, 
      `data-ride` = "carousel", 
      carouselNav, 
      carouselContent, 
      carouselControls
    )
  )
  argonR::argonContainer(
    argonR::argonColumn(width = width, carouselTag)
  )
}
