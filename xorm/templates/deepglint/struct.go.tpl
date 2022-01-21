package {{.Models}}

{{$ilen := len .Imports}}
{{if gt $ilen 0}}
import (
	{{range .Imports}}"{{.}}"{{end}}
)
{{end}}

{{range .Tables}}
const TableName{{Mapper .Name}}="{{.Name}}"
type {{Mapper .Name}} struct {
{{$table := .}}
// {{.Comment}}
{{range .ColumnsSeq}} {{$col := $table.GetColumn .}}	{{Mapper $col.Name}}	{{Type $col}} {{Tag $table $col}} // {{$col.Comment}}
{{end}}
}
func (e {{Mapper $table.Name}}) TableName() string {
	return TableName{{Mapper .Name}}
}
{{end}}

