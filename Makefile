# Makefile для генерации кода из proto файлов

# Целевая директория для генерации
GEN_DIR := gen/go

# Основная цель, которая будет выполняться по умолчанию
all: generate

# Цель для генерации кода
generate:
	@mkdir -p $(GEN_DIR)
	@protoc -I proto proto/sso/*.proto \
		--go_out=$(GEN_DIR) \
		--go_opt=paths=source_relative \
		--go-grpc_out=$(GEN_DIR) \
		--go-grpc_opt=paths=source_relative

# Алиас для команды generate
gen: generate

# Очистка сгенерированных файлов
clean:
	@rm -rf $(GEN_DIR)

.PHONY: all generate gen clean