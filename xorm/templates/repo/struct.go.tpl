package jssxormimpl

import (
	"gitlab.deepglint.com/deepface/pallas/entity"
	"gitlab.deepglint.com/deepface/pallas/repository"
)
{{range .Tables}}
type {{Mapper .Name}}Repository struct {
	session *Session
}

func New{{Mapper .Name}}Repository(session *Session) repository.{{Mapper .Name}}Repository {
	return &{{Mapper .Name}}Repository{
		session: session,
	}
}
func (r *{{Mapper .Name}}Repository) GetEntityByIdNo(idNo string) (interface{}, error) {
	{{low .Name}} := new(entity.{{Mapper .Name}})
	ok, err := r.session.Table(entity.TableName{{Mapper .Name}}).ID(idNo).Get({{low .Name}})
	if err != nil {
		return nil, err
	}
	if !ok {
		return nil, nil
	}
	return {{low .Name}}, nil
}

{{end}}