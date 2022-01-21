
{{range .Tables}}
{{$table := .}}
{{range .ColumnsSeq}}{{$col := $table.GetColumn .}}{{`,`}}{{low $col.Name}}{{end}}
{{end}}

