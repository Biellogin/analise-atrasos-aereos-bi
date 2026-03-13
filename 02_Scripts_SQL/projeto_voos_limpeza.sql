CREATE TABLE voos_atrasados (
    id SERIAL PRIMARY KEY,
    ano INTEGER,
    mes INTEGER,
    dia_mes INTEGER,
    dia_semana INTEGER,
    companhia VARCHAR(10),
    origem VARCHAR(5),
    destino VARCHAR(5),
    atraso_partida INTEGER,
    atraso_chegada INTEGER,
    cancelado INTEGER,
    motivo_atraso_clima INTEGER,
    motivo_atraso_sistema INTEGER
);

INSERT INTO voos_atrasados (ano, mes, dia_mes, dia_semana, companhia, origem, destino, atraso_partida, atraso_chegada, cancelado, motivo_atraso_clima, motivo_atraso_sistema)
VALUES 
(2024, 3, 13, 5, 'LATAM', 'SSA', 'GRU', 20, 25, 0, 0, 25),
(2024, 3, 14, 6, 'AZUL', 'GIG', 'SSA', 10, NULL, 0, 0, 0),
(2024, 3, 15, 7, 'GOL', 'BSB', 'FOR', 0, 0, 1, 0, 0);


SELECT 
    companhia,
    origem,
    destino,
    COALESCE(atraso_chegada, 0) AS atraso_limpo,
    CASE 
        WHEN atraso_chegada > 15 THEN 'Atraso Crítico'
        WHEN atraso_chegada <= 15 THEN 'No Prazo'
        ELSE 'Cancelado'
    END AS status_pontualidade
FROM voos_atrasados;