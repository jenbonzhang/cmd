package repository


{{range .Tables}}
type {{Mapper .Name}}Repository interface {
}
{{end}}

