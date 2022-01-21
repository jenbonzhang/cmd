package {{.Models}}

{{range .Tables}}

{{$table := .}}
// New{{Mapper $table.Name}}Repository 创建{{.Comment}}的工厂
func (f *Factory) New{{Mapper $table.Name}}Repository(session repository.Session) (repository.{{Mapper $table.Name}}Repository, error) {
	if session, ok := session.(*Session); ok {
		return New{{Mapper $table.Name}}Repository(session), nil
	}
	return nil, errors.New("xorm session 结构解析失败")
}
{{end}}

