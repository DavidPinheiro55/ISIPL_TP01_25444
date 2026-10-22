
CREATE TABLE IF NOT EXISTS observations (
    id BIGSERIAL PRIMARY KEY,
    location_name TEXT NOT NULL,
    observed_at TIMESTAMPTZ NOT NULL,
    wave_height_m NUMERIC(6,2),
    wave_period_s NUMERIC(6,2),
    ipma_warning_level TEXT,
    risk_level TEXT NOT NULL,
    risk_reason TEXT,
    source TEXT NOT NULL,
    ingested_at TIMESTAMPTZ DEFAULT NOW(),
    UNIQUE (location_name, observed_at)
);

CREATE TABLE IF NOT EXISTS alerts (
    id BIGSERIAL PRIMARY KEY,
    location_name TEXT NOT NULL,
    created_at TIMESTAMPTZ DEFAULT NOW(),
    risk_level TEXT NOT NULL,
    message TEXT NOT NULL,
    email_sent BOOLEAN DEFAULT FALSE
);

CREATE TABLE IF NOT EXISTS ipma_comunicados (
    id BIGSERIAL PRIMARY KEY,
    titulo TEXT NOT NULL,
    ligacao TEXT,
    data_publicacao TIMESTAMP,
    descricao TEXT,
    fonte TEXT NOT NULL DEFAULT 'IPMA_RSS',
    importado_em TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    UNIQUE (titulo, data_publicacao)
);
