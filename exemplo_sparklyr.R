library(sparklyr)
library(dplyr)

#spark_install()
#spark_installed_versions()

sc <- spark_connect(master = "local")
spark_web(sc)

## Inserir dados
cars <- copy_to(sc, mtcars)
cars
count(cars)

## Gráfico com amostra
select(cars, hp, mpg) %>%
  sample_n(100) %>%
  collect() %>%
  plot()

## Modelos
model <- ml_linear_regression(cars, mpg ~ hp)
model

## Exportar resultados
spark_write_csv(cars, "cars.csv")

