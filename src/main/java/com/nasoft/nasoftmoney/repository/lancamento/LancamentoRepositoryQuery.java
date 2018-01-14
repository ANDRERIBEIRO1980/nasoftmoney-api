package com.nasoft.nasoftmoney.repository.lancamento;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import com.nasoft.nasoftmoney.model.Lancamento;
import com.nasoft.nasoftmoney.repository.filter.LancamentoFilter;
import com.nasoft.nasoftmoney.repository.projection.ResumoLancamento;

public interface LancamentoRepositoryQuery {

    public Page<Lancamento> filtrar(LancamentoFilter lancamentoFilter, Pageable pageable);
    public Page<ResumoLancamento> resumir(LancamentoFilter lancamentoFilter, Pageable pageable);
}
