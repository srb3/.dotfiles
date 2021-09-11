return {
  formatCommand = ([[
    $([ -n "$(command -v node_modules/.bin/prettier)" ] && echo "node_modules/.bin/prettier" || echo "prettier")
    ${--config-precedence:configPrecedence}
    ${--tab-width:tabWidth}
    ${--trailing-comma:trailingComma}
  ]]):gsub("\n", ""),
}
