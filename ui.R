library(shiny)
library(shinydashboard)



header <- dashboardHeader(title = 'IS/LM',
                          dropdownMenu(
                            type = 'message',
                            messageItem(from = 'Jose Vinicius', message = 'Created by Joseph Viny and Tito')
                          ))

sidebar <- dashboardSidebar(
  sidebarMenu(
    sidebarSearchForm('searchText', 'buttonSearch', 'Procurar'),
    menuItem('IS-LM', tabName = 'islm'),
    menuItem('Modelo', tabName = 'modelo', badgeLabel = 'Leia', badgeColor = 'red'))
)

body <- dashboardBody(
  tabItems(
    tabItem(tabName = 'islm',
            
            fluidRow(
              box(width = 12,
                  h1('Modelo IS-LM'),
                  p('Este modelo possui o intuito de desenvolver as capacidades analiticas do estudante em relaca a alguns modelos macroeconomicos.'))
              ),
            
            fluidRow(
              infoBoxOutput('Renda'),
              infoBoxOutput('Taxa'),
              infoBoxOutput('alpha')
            ),
            
            fluidRow(
              box(title = 'Gastos Autonomos',
                  status = 'primary',
                  solidHeader = T,
                  collapsible = T,
                  collapsed = T,
                sliderInput('c_0',
                              'Consumo Autonomo',
                              min = 0,
                              max = 100,
                              value = 50,
                              step = 10),
                sliderInput('i_0',
                              'Investimento Autonomo',
                              min = 0,
                              max = 100,
                              value = 50,
                              step = 10),
                sliderInput('g_0',
                              'Gastos do Governo',
                              min = 0,
                              max = 100,
                              value = 30,
                              step = 10)),
              
              box(title = 'Parametros da LM',
                  status = 'primary',
                  solidHeader = T,
                  collapsible = T,
                  collapsed = T,
                  
                  sliderInput('m',
                              'Oferta de Moeda',
                              min = 10,
                              max = 150,
                              value = 60,
                              step = 10),
                  
                  sliderInput('e',
                              'Sensibilidade da Demanda por Moeda / Renda',
                              min = 0,
                              max = 1,
                              value = 0.5,
                              step = 0.1),
                  sliderInput('f',
                              'Sensibilidade da Demanda por Moeda / Taxa de Juros',
                              min = 0,
                              max = 10,
                              value = 4,
                              step = 1))),
            fluidRow(
              box(width = 12,
                  title = 'Parametros da IS',
                  status = 'primary',
                  solidHeader = T,
                  collapsible = T,
                  collapsed = T,
                  sliderInput('c_1',
                              'Propensao Marginal a Consumir',
                              min = 0,
                              max = 1,
                              value = 0.8,
                              step = 0.1),
                  sliderInput('b',
                              'Sensibilidade Investimento-Juros',
                              min = 0,
                              max = 10,
                              value = 5,
                              step = 1))
            )
),
    
    tabItem(tabName = 'modelo',
            fluidRow(
              box(status = 'primary',
                  solidHeader = T,
                  collapsible = F,
                  collapsed = F,
                  title = 'Download',
                  p('Visualize ou faça o download do modelo no DropBox'),
                  a(h4('Leia', class = 'btn btn-default action-button',
                       style = "fontweight:600"),
                    target = '_blank', href = paste0('https://www.dropbox.com','/s/3wwwbvp1mfb1pox/IS-LM.pdf?dl=0')))
            ))
    
  )
)

shinyUI(
  dashboardPage(
    header = header,
    sidebar = sidebar,
    body = body
    ))
