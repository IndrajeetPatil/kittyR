render_report <- function(include_html_table) {
  rmarkdown::render(
    input = "README.Rmd",
    output_format = "github_document",
    params = list(include_html_table = include_html_table),
    output_file = ifelse(include_html_table, "index.md", "README.md")
  )
}

purrr::walk(.x = list(TRUE, FALSE), ~ render_report(.x))
