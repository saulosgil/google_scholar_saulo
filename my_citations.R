# Pacotes -------------------------------------------------------------------------------------
library(scholar)
library(tidyverse)

# Saulo Gil -----------------------------------------------------------------------------------
id_scholar <- "LRlhXK8AAAAJ" # define o ID do Google Scholar

perfil <- scholar::get_profile(id = "LRlhXK8AAAAJ") # pegas os dados online

perfil[2] # Confirmar se sou eu mesmo rs

# citações ------------------------------------------------------------------------------------

cites <- scholar::get_citation_history(perfil$id) # número de citações por ano
dplyr::glimpse(cites)

# plot ----------------------------------------------------------------------------------------
g1 <-
  cites |>
  ggplot2::ggplot(mapping = ggplot2::aes(x = year,
                                         y = cites)) +
  ggplot2::geom_line(linetype  = 6, col = "red") +
  ggplot2::geom_point(, size = 3, col = "red") +
  ggplot2::theme_bw() +
  ggplot2::labs(title = "Number of citations in the Google Scholar",
                subtitle = "Saulo Gil (2013 - 2023)",
                caption = "Source: Google scholar") +
  ggplot2::xlab(label = "Year") +
  ggplot2::ylab(label = "Number of citations") +
  ggplot2::scale_x_continuous(breaks = c(2013:2023)) +
  ggplot2::geom_text(mapping = ggplot2::aes(label = cites),
                     col = "red",
                     size = 3,
                     vjust = -.8) +
  ggplot2::theme(text = ggplot2::element_text(size = 15))

g1

# save
ggplot2::ggsave("citation.png")
