package com.nasoft.nasoftmoney.converter;

import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;

import com.nasoft.nasoftmoney.model.Lancamento;

@Component
public class LancamentoConverter implements Converter<Lancamento, Lancamento>{

	@Override
	public Lancamento convert(Lancamento origem) {

		Lancamento lancamento = new Lancamento();
		lancamento.setCodigo(origem.getCodigo());
		lancamento.setDescricao(origem.getDescricao());
		lancamento.setPessoa(origem.getPessoa());
		return lancamento;
	}

}
