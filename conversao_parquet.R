library(sparklyr)

endereco = '/home/tumenas/Aulas/BigData/dados/microdados_enem_2019/DADOS/'
nome_arquivo = 'MICRODADOS_ENEM_2019'

endereco_parquet = '/home/tumenas/Aulas/BigData/dados/microdados_enem_2019/DADOS/parquet/'
endereco_orc = '/home/tumenas/Aulas/BigData/dados/microdados_enem_2019/DADOS/orc/'


sc <- spark_connect(master = "local")

#Ler arquivo
base_spark <- spark_read_csv(sc, name = nome_arquivo,
                       header = TRUE,    
                       path= endereco,
                       delimiter = ";",memory=FALSE)
#Copiar em Parquet
spark_write_parquet(
  base_spark,
  endereco_parquet,
  mode = NULL,
  list(spark.sql.parquet.compression.codec="lzo"))


#Copiar em ORC
spark_write_orc(
  base_spark,
  endereco_orc,
  mode = NULL)

