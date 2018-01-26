package com.nasoft.nasoftmoney.converter;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.core.convert.converter.Converter;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.util.Assert;

/**
 * 
 * @param <T> origem
 * @param <V> destino
 */
public class PageConverter<T, V> implements Page<T> {

    private final Page<V> page;
    private final List<T> content;

    public PageConverter(Page<V> page, final Converter<V, T> converter) {
        this.page = page;
        this.content = new ArrayList<T>(page.getSize());

        for (V element : page.getContent()) {
            content.add(converter.convert(element));
        }
    }

    @Override
    public int getNumber() {
        return page.getNumber();
    }

    @Override
    public int getSize() {
        return page.getSize();
    }

    @Override
    public int getNumberOfElements() {
        return page.getNumberOfElements();
    }

    @Override
    public List<T> getContent() {
        return content;
    }

    @Override
    public boolean hasContent() {
        return page.hasContent();
    }

    @Override
    public Sort getSort() {
        return page.getSort();
    }

    @Override
    public boolean isFirst() {
        return page.isFirst();
    }

    @Override
    public boolean isLast() {
        return page.isLast();
    }

    @Override
    public boolean hasNext() {
        return page.hasNext();
    }

    @Override
    public boolean hasPrevious() {
        return page.hasPrevious();
    }

    @Override
    public Pageable nextPageable() {
        return page.nextPageable();
    }

    @Override
    public Pageable previousPageable() {
        return page.previousPageable();
    }

    @Override
    public Iterator<T> iterator() {
        return content.iterator();
    }

    @Override
    public int getTotalPages() {
        return page.getTotalPages();
    }

    @Override
    public long getTotalElements() {
        return page.getTotalElements();
    }

    @Override
    public <S> Page<S> map(Converter<? super T, ? extends S> converter) {
        Assert.notNull(converter, "Converter must not be null!");

        List<S> valores = new ArrayList<S>(content.size());

        for (T element : this) {
            valores.add(converter.convert(element));
        }

        return null;
    }
}
