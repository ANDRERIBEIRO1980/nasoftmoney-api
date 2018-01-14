package com.nasoft.nasoftmoney.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.nasoft.nasoftmoney.model.Lancamento;
import com.nasoft.nasoftmoney.repository.lancamento.LancamentoRepositoryQuery;

public interface LancamentoRepository extends JpaRepository<Lancamento, Long>, LancamentoRepositoryQuery {

}
