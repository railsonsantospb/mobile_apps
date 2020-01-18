package com.amigo.catador;

import java.io.Serializable;

public class LocationData implements Serializable {

    public double latitude;
    public double longitude;
    public String nome;
    public String rua;
    public String bairro;
    public String telefone;
    public String texto;
    public String item;

    public LocationData(double latitude, double longitude, String nome, String rua, String bairro,
                        String telefone, String texto, String item) {
        this.latitude = latitude;
        this.longitude = longitude;
        this.nome = nome;
        this.rua = rua;
        this.bairro = bairro;
        this.telefone = telefone;
        this.texto = texto;
        this.item = item;
    }
}