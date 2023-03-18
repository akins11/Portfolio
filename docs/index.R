library(shiny)
library(argonR)
library(htmltools)

# source("~/R/Aboutme/pages")



index_page <- argon_page(
  
  # META -----------------------------------------------------------------------
  title = "Ayomide",
  author =  "Akinwande Ayomide",
  # favicon = "dib_fav.png",
  favicon = "fav_dib.png",
  
  # -------------------------------- HEADER ------------------------------------
  # Nav ------------------------------------------------------------------------
  navbar = navbar( 
    
    id = "main-navbar",
    src = "inst/images/dib_home.svg",
    headroom = FALSE,
    
    argonNavMenu(
      
      side = "right",
      argon_nav_item(
        name = "Home",
        src = "#home"#,
        # icon = fa_icon("home", "solid")
      ),
      
      argon_nav_item(
        name = "About",
        src = "#about"#,
        # icon = fa_icon("user", "solid")
      ),
      
      argon_nav_item(
        name = "Skills",
        src = "#skill"#,
        # icon = fa_icon("file-lines", "solid")
      ),
      
      argon_nav_item(
        name = "Sevice",
        src = "#service"#,
        # icon = fa_icon("briefcase", "solid")
      ),
      
      argon_nav_item(
        name = "Portfolio",
        src = "#portfolio"#,
        # icon = fa_icon("image", "solid")
      ),
      
      argon_nav_item(
        name = "Contact",
        src = "#contact"#,
        # icon = fa_icon("paper-plane", "solid")
      ),
      
      htmltools::tags$li(
        class = "nav-item",
        
        theme_toggle_button()
      )
    )
  ),
  
  # -------------------------------- MAIN --------------------------------------
  div(class = "top_space"),
  # Home -----------------------------------------------------------------------
  section(
    id = "home",
    size = "sm",
    
    argonColumn(
      
      argonRow(
        
        argonColumn(
          width = 8,
          
          argonRow(
            argonColumn(
              width = 1,
              
              div(
                class = "home__icons",
                div(
                  link_icon(
                    link = "https://www.linkedin.com/in/akinwande-ayomide-7bb37a199",
                    icon = "linkedin-in",
                    class = "home__social-icon"
                  )
                ),
                div(
                  link_icon(
                    link = "https://twitter.com/Akinwande_ay24?s=09",
                    icon = "twitter",
                    class = "home__social-icon"
                  )
                ),
                div(
                  link_icon(
                    link = "https://github.com/akins11/",
                    icon = "github",
                    class = "home__social-icon"
                  )
                )
              )
            ),
            
            argonColumn(
              
              argonRow(
                h2(class = "home__title", "Hi!, I’m Ayomide"),
                
                p(
                  class = "home__description",
                  "A strategic data analyst with a desire to develop effective data 
                  projects from design through to implementation. My goal is to unravel 
                  complex business problems and improve efficiency by delivering 
                  actionable insights using various analytical tools"
                )
              ),
              
              argonRow(
                argonColumn(
                  width = 4,
                  
                  page_path_button(
                    text = "Contact Me",
                    icon = fa_icon(name = "paper-plane",
                                   type = "regular"),
                    page_href = "#contact"
                  )
                )
              )
            )
          )
        ),
        
        argonColumn(
          width = 4,
          
          argonImage(
            # src = "inst/images/dib_logo.svg",
            src = "inst/images/dib_home.svg",
            floating = FALSE
          ) |>
            argonBlur()
        )
      )
    )
  ),
  
  # About ----------------------------------------------------------------------
  section(
    id = "about",
    size = "md",
    
    argonColumn(
      argonRow(
        center = TRUE,
        
        argonColumn(
          width = 12,
          center = TRUE,
          
          h2(class = "section__title", "About Me"),
          
          h3(class = "section__subtitle", "My introduction")
        )
      ),
      
      argonRow(
        argonColumn(
          width = 6,
          
           p(
             class = "about__description",
             "I specialize in enhancing existing processes through various data tasks,
             including data cleaning, exploratory data analysis, data visualization, 
             data mining, and building machine learning models."
           )
        ),
        
        argonColumn(
          width = 6,
          
          argonRow(
            argonColumn(
              width = 4,
              
              h5(class = "about__info-title", "01+"),
              span(
                class = "about__info-subtitle", 
                "Years",
                br(),
                "Experience"
              )
            ),
            
            argonColumn(
              width = 4,
              
              h5(class = "about__info-title", "12+"),
              span(
                class = "about__info-subtitle", 
                "Completed",
                br(),
                "Projects"
              )
            ),
            
            argonColumn(
              width = 4,
              
              h5(class = "about__info-title", "02+"),
              span(
                class = "about__info-subtitle last", 
                "Internship",
                br(),
                "Done"
              )
            )
          )
        )
      ),
      
      br(),
      
      argonRow(
        center = TRUE,
        
        argonColumn(
          width = 12,
          center = TRUE,
          
          download_cv_button()
        )
      )
    )
  ),
  
  # Skills ---------------------------------------------------------------------
  section(
    id = "skill",
    size = "md",
    
    argonColumn(
      argonRow(
        center = TRUE,
        argonColumn(
          width = 12,
          center = TRUE,
          
          h2(class = "section__title", "Skills"),
          
          h3(class = "section__subtitle", "technical tools")
        )
      ),
      
      argonRow(
        center = TRUE,
        
        argonTabSet(
          id = "skills_tabset",
          size = "sm",
          width = 10,
          card_wrapper = FALSE,
          
          iconList = list(
            fa_icon("chart-line", "solid"),
            fa_icon("chart-column", "solid"),
            fa_icon("code", "solid")
          ),
          
          # Data Science ------------------------------------------------------|
          argonTab(
            tabName = "Data Science",
            active = TRUE,

            div(
              class = "skill__tool",
              div(
                class = "skill__header", 
                fa_icon("r-project", "brands", other_class = "skill__icon"),
                span(class = "skill__header-text", "R Language")
              ),
              div(
                class = "skill_framework",
                badge("R Shiny"),
                badge("Flexdashboards"),
                badge("Quarto"),
                badge("Tidyverse"),
                badge("Tidymodels")
              )
            ),
            
            div(
              class = "skill__tool",
              div(
                class = "skill__header", 
                fa_icon("python", "brands", other_class = "skill__icon"),
                span(class = "skill__header-text", "Python Language")
              ),
              div(
                class = "skill_framework",
                badge("Pandas"),
                badge("Dash"),
                badge("Scikit Learn"),
                badge("Plotly")
              )
            ),
            
            div(
              class = "skill__tool",
              div(
                class = "skill__header", 
                fa_icon("database", "solid", other_class = "skill__icon"),
                span(class = "skill__header-text", "SQL")
              ),
              div(
                class = "skill_framework",
                badge("Cleaning"),
                badge("Modelling"),
                badge("Exploratory Analysis"),
                badge("Data transformation")
              )
            )
          ),
          
          # Data Analysis -----------------------------------------------------|
          argonTab(
            tabName = "Data Analysis",
            active = FALSE,
            
            div(
              class = "skill__tool",
              div(
                class = "skill__header", 
                fa_icon("file-excel", "regular", other_class = "skill__icon"),
                span(class = "skill__header-text", "MS-Excel")
              ),
              div(
                class = "skill_framework",
                badge("Data Exploartion"),
                badge("Pivot Tables"),
                badge("Visualization"),
                badge("Regression Analysis")
              )
            ),
            div(
              class = "skill__tool",
              div(
                class = "skill__header", 
                fa_icon("chart-simple", "solid", other_class = "skill__icon"),
                span(class = "skill__header-text", "Power BI")
              ),
              div(
                class = "skill_framework",
                badge("Cleaning"),
                badge("Modelling"),
                badge("Exploratory Analysis"),
                badge("Dashboard")
              )
            )
          ),
          
          # Font-end development ----------------------------------------------|
          argonTab(
            tabName = "Frontend Development",
            active = FALSE,
            
            div(
              class = "skill__tool",
              div(
                class = "skill__header", 
                fa_icon("html5", "brands", other_class = "skill__icon"),
                span(class = "skill__header-text", "HTML")
              ),
              div(
                class = "skill_framework",
                badge("Web Page"),
                badge("Designing layouts")
              )
            ),
            div(
              class = "skill__tool",
              div(
                class = "skill__header", 
                fa_icon("css3-alt", "brands", other_class = "skill__icon"),
                span(class = "skill__header-text", "CSS")
              ),
              div(
                class = "skill_framework",
                badge("Responsive Layout"),
                badge("Bootstrap"),
                badge("Fomatic UI")
              )
            ),
            div(
              class = "skill__tool",
              div(
                class = "skill__header", 
                fa_icon("square-js", "brands", other_class = "skill__icon"),
                span(class = "skill__header-text", "JavaScript")
              ),
              div(
                class = "skill_framework",
                badge("DOM Manipulation"),
                badge("Dynamic Web Page Interactions")
              )
            ),
            div(
              class = "skill__tool",
              div(
                class = "skill__header", 
                fa_icon("react", "brands", other_class = "skill__icon"),
                span(class = "skill__header-text", "React")
              ),
              div(
                class = "skill_framework",
                badge("Dashboard")
              )
            )
          )
        )
      )
    )
  ),
  
  # Service --------------------------------------------------------------------
  section(
    id = "service",
    size = "md",
    
    argonColumn(
      argonRow(
        center = TRUE,
        argonColumn(
          width = 12,
          center = TRUE,
          
          h2(class = "section__title", "Service"),
          
          h3(class = "section__subtitle", "What i offer")
        )
      ),
      
      argonRow(
        center = TRUE,
        
        argonColumn(
          width = 4,
          
          serviceCard(
            div(
              class = "service__content",
              
              div(fa_icon("chart-bar", "solid", other_class = "service__icon")),
              h4(class = "service__title", "Data Analysis"),
              h5(class = "service__subtitle", "Solutions"),
              modal_button("da_modal")
            )
          ),
          
          argonColumn(
            width = 6,
            
            serviceModal(
              id = "da_modal",
              title = "Data Analytics Solution",
              
              div(
                class = "services__modal-content",
                
                tags$ul(
                  class = "services__modal-services",
                  
                  service_list_item("Data cleaning & validdation."),
                  service_list_item("Create insightful & interactive visualization"),
                  service_list_item("Diagnostic data analysis"),
                  service_list_item("Data mining"),
                  service_list_item("Data Modelling")
                )
              )
            )
          )
        ),
        
        argonColumn(
          width = 4,
          
          serviceCard(
            # width = 12,
            
            div(
              class = "service__content",
              
              div(fa_icon("cube", "solid", other_class = "service__icon")),
              h4(class = "service__title", "Analytical App"),
              h5(class = "service__subtitle","Development"),
              modal_button("aa_modal")
            )
          ),
          
          argonColumn(
            width = 6,
            
            serviceModal(
              id = "aa_modal",
              title = "Analytical web app",
              
              div(
                class = "services__modal-content",
                
                tags$ul(
                  class = "services__modal-services",
                  
                  service_list_item("Business insight applications"),
                  service_list_item("Customer analytics applications"),
                  service_list_item("Product analytics applications")
                )
              )
            )
          )
        ),
        
        argonColumn(
          width = 4,
          
          serviceCard(
            
            div(
              class = "service__content",
              
              div(fa_icon("table-columns", "solid", other_class = "service__icon")),
              h4(class = "service__title", "Dashboards"),
              h5(class = "service__subtitle", "Creation"),
              modal_button("db_modal")
            )
          ),
          
          argonColumn(
            width = 6,
          
            serviceModal(
              id = "db_modal",
              title = "Dashboard development",
              
              div(
                class = "services__modal-content",
                
                tags$ul(
                  class = "services__modal-services",
                  
                  service_list_item("Admin dashboards"),
                  service_list_item("Sales and marketing dashboards"),
                  service_list_item("Operations dashboards"),
                  service_list_item("Human resources dashboards")
                )
              )
            )
          )
        )
      )
    )
  ),
  
  # Portfolio ------------------------------------------------------------------
  section(
    id = "portfolio",
    size = "md",
    
    argonColumn(
      argonRow(
        center = TRUE,
        argonColumn(
          width = 12,
          center = TRUE,
          
          h2(class = "section__title", "Portfolio"),
          
          h3(class = "section__subtitle", "Most recent work")
        )
      ),
      
      argonRow(
        argonTabSet(
          id = "portfolio_tabset",
          width = 12,
          card_wrapper = FALSE,
          iconList = list(
            fa_icon("cube", "solid"),
            fa_icon("table-columns", "solid"),
            fa_icon("robot", "solid"),
            fa_icon("magnifying-glass-chart", "solid")
          ),
          
          argonTab(
            tabName = "Analytical App",
            active = TRUE,
            
            carousel(
              width = 12,
              id = "ap_carousel",
              portfolio(
                active = TRUE,
                img_src = "inst/images/project_img/market-segmentation-app.png",
                title = "Market Segmentation Analysis App",
                tools_used = c("R", "R Shiny", "Bootstrap"),
                # tools_used = "R | R Shiny | Bootstrap",
                description = "Performs market segmentation analysis using selected
                               cluster algorithms, summarise each cluster and also
                               create segments using different approaches.",
                more_text = TRUE,
                project_src = "https://akinwandeayomide.shinyapps.io/segmentationAnalysisApp/",
                code_src = "https://github.com/akins11/Segmentation-analysis-app"
              ),
              
              portfolio(
                img_src = "inst/images/project_img/mba-app.png",
                title = "Market Basket Analysis App",
                tools_used = c("Python", "Dash", "Bootstrap"),
                # tools_used = "Python | Dash | Bootstrap",
                description = "A tool that enables businesses to analyze their transaction 
                              data and identify patterns of co-occurring product purchases",
                more_text = TRUE,
                project_src = "https://market-basket-analysis.onrender.com/",
                code_src = "https://github.com/akins11/market-basket-analysis-web-app"
              ),
              
              portfolio(
                img_src = "inst/images/project_img/rfm-app.png",
                title = "RFM Analysis App",
                tools_used = c("R", "R Shiny", "Bootstrap"),
                # tools_used = "R | R Shiny | Bootstrap",
                description = "Performs behavior based customer segmentation 
                               using of RFM analysis, which help in distinguishing 
                               customers.",
                project_src = "https://akinwandeayomide.shinyapps.io/RFM-app/",
                code_src = "https://github.com/akins11/RFM-analysis-app"
              ),
              
              
              portfolio(
                img_src = "inst/images/project_img/conjoint-app.jpg",
                title = "Conjoint Analysis App",
                tools_used = c("R", "R Shiny", "Formatic UI"),
                description = "It helps market researcher to understand how 
                               consumers make trade-offs between different product 
                               attributes.",
                # tools_used = "R | R Shiny | Formatic UI",
                project_src = "https://akinwandeayomide.shinyapps.io/RFM-app/",
                code_src = "https://github.com/akins11/RFM-analysis-app"
              )
            )
          ),
          
          argonTab(
            tabName = "Dashboard",
            active = FALSE,
            
            carousel(
              width = 12,
              id = "db_carousel",
              
              portfolio(
                active = TRUE,
                img_src = "inst/images/project_img/hotel-mgt.png",
                title = "Hotel Management Dashoard",
                tools_used = c("R", "Flexdashboard", "bootstrap"),
                # tools_used = "R | Flexdashboard | bootstrap",
                description = "Breaks down of revenue, reservations and guests 
                               treatment to generate key insights for making 
                               informed decisions.",
                more_text = TRUE,
                project_src = "https://akins11.github.io/Hotel-management-dashboard/",
                code_src = "https://github.com/akins11/Hotel-management-dashboard"
              ),
              
              portfolio(
                img_src = "inst/images/project_img/product-dashboard.jpg",
                title = "Product Analysis Dashboard",
                tools_used = c("R", "R Shiny", "bootstrap"),
                # tools_used = "R | R Shiny | bootstrap",
                description = "A detailed Report on the profitability of various 
                               products, showcasing insights and performance across 
                               specific period.",
                more_text = TRUE,
                project_src = "https://akinwandeayomide.shinyapps.io/productDashboard/",
                code_src = "https://github.com/akins11/Product-Dashboard"
              ),
              
              portfolio(
                img_src = "inst/images/project_img/regional-sales-dashboard.png",
                title = "Sales Dashboard",
                tools_used = c("R", "R Shiny", "bootstrap"),
                # tools_used = "R | R Shiny | bootstrap",
                description = "A visual summary of sales performance across 
                               different regions within a specific period of 
                               time.",
                project_src = "https://akinwandeayomide.shinyapps.io/regionalSalesDashboard/",
                code_src = "https://github.com/akins11/Regional-Sales-Dashboard"
              ),
              
              portfolio(
                img_src = "inst/images/project_img/sales-report.png",
                title = "Sales Report",
                tools_used = c("Excel", "Power BI"),
                # tools_used = "Excel | Power BI",
                description = "A concise and insightful report of sales across 
                               various regions and periods.",
                project_src = "https://github.com/akins11/Sales-Report",
                code_src = "https://github.com/akins11/Sales-Report"
              )
            )
          ),
          
          argonTab(
            tabName = "ML",
            active = FALSE,
            
            carousel(
              width = 12,
              id = "ml_carousel",
              portfolio(
                active = TRUE,
                img_src = "inst/images/project_img/pm25-chart.png",
                title = "PM2.5 Sensor Offset Prediction",
                tools_used = c("Python", "Pandas", "Plotnine", "Scikit Learn"),
                # tools_used = "Python | Pandas | Plotnine | Scikit-Learn",
                description = "Predictions of particle matter (PM2.5) sensor offsets
                               signals using a supervised classification algorithm.",
                project_src = "https://akins11.github.io/PM2.5-Sensor-Offset-Prediction/",
                code_src = "https://github.com/akins11/PM2.5-Sensor-Offset-Prediction"
              ),
              
              portfolio(
                img_src = "inst/images/project_img/web-sales-prediction.png",
                title = "Web Store Sales Prediction",
                tools_used = c("R", "dplyr", "ggplot2", "Tidymodel"),
                # tools_used = "R | dplyr | ggplot2 | Tidymodel",
                description = "Prediction of potential sales of various collection
                               of high quality clothing brands using supervised 
                               regression model.",
                project_src = "https://akins11.github.io/web-sales-prediction/",
                code_src = "https://github.com/akins11/web-sales-prediction"
              )
            )
          ),
          
          argonTab(
            tabName = "EDA",
            active = FALSE,
            
            carousel(
              width = 12,
              id = "eda_carousel",
              portfolio(
                active = TRUE,
                img_src = "inst/images/project_img/hotel-guest-review.png",
                title = "Hospitality Guest Review",
                tools_used = c("Python", "Pandas", "Plotly", "NLTK"),
                # tools_used = "Python | Pandas | Plotly | NLTK",
                description = "Sentiment analysis on guests review of their 
                               respective host accommodation.",
                project_src = "https://akins11.github.io/hospitality-guest-review/",
                code_src = "https://github.com/akins11/hospitality-guest-review"
              ),
              
              portfolio(
                img_src = "inst/images/project_img/sql-eda.png",
                title = "Regional Sales Exploratory Analysis",
                tools_used = c("SQL", "MySQL", "Quarto"),
                # tools_used = "SQL | MySQL | Quarto",
                description = "Exploring business sales performance within a 
                               selected period of time.",
                project_src = "https://akins11.github.io/Exploratory-analysis-using-SQL/",
                code_src = "https://github.com/akins11/Exploratory-analysis-using-SQL"
              )
            )
          )
        )
      )
    )
  ),
  
  # Project --------------------------------------------------------------------
  # argonSection(
  #   id = "project",
  #   size = "md",
  #   status = "default",
  #   
  #   argonContainer(
  #     argonRow(
  #       center = TRUE,
  #       argonColumn(
  #         width = 12,
  #         center = TRUE,
  #         
  #         h2(class = "section__title", "You have a new project contact me"),
  #         
  #         h3(
  #           class = "section__subtitle", 
  #           "Contact me now and get a 10% discount on your new projec"
  #         )
  #       )
  #     ),
  #     
  #     argonRow(
  #       argonButton(name = "Contact")
  #     )
  #   )
  # )
  
  # -------------------------------- FOOTER ------------------------------------
  # Contact -------------------------------------------------------------------|
  footer = portfolio_footer(),
  
  scroll_up_button()
)


argonPageTemplate(
  filename = "index", 
  path = "C:/Users/AYOMIDE/Documents/R/Aboutme/docs", 
  index_page
)
