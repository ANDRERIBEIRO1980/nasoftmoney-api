package com.nasoft.nasoftmoney.repository.pessoa;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.nasoft.nasoftmoney.model.Pessoa;
import com.nasoft.nasoftmoney.repository.filter.PessoaFilter;

public interface PessoaRepositoryQuery {

    public Page<Pessoa> filtrar(PessoaFilter lancamentoFilter, Pageable pageable);
}
