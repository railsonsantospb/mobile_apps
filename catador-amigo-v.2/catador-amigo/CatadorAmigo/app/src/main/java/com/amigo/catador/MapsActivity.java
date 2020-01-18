package com.amigo.catador;

import android.app.AlertDialog;
import android.app.Fragment;
import android.content.DialogInterface;
import android.location.Address;
import android.location.Geocoder;
import android.location.Location;
import android.location.LocationListener;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.design.widget.FloatingActionButton;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.Toast;

import com.amigo.catador.R;
import com.google.android.gms.maps.CameraUpdateFactory;
import com.google.android.gms.maps.GoogleMap;
import com.google.android.gms.maps.MapFragment;
import com.google.android.gms.maps.OnMapReadyCallback;
import com.google.android.gms.maps.model.BitmapDescriptorFactory;
import com.google.android.gms.maps.model.CameraPosition;
import com.google.android.gms.maps.model.LatLng;
import com.google.android.gms.maps.model.MarkerOptions;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

public class MapsActivity extends Fragment implements OnMapReadyCallback, LocationListener {

    private GoogleMap mMap;
    private FirebaseDatabase firebase = FirebaseDatabase.getInstance();
    private DatabaseReference mDatabase = firebase.getReference();
    double l1 = 0, l2 = 0;
    Spinner sp;
    String item = "";
    String address = "";

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        mDatabase = FirebaseDatabase.getInstance().getReference();
        return inflater.inflate(R.layout.activity_maps, container,false);
    }

    @Override
    public void onViewCreated(View view, Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);

        MapFragment fragment = (MapFragment) getChildFragmentManager().findFragmentById(R.id.map);
        fragment.getMapAsync(this);
    }

    @Override
    public void onMapReady(GoogleMap googleMap) {

        mMap = googleMap;

        AlertDialog.Builder alertDialog = new AlertDialog.Builder(getActivity());
        alertDialog.setTitle("Quando solicitar nossa ajuda?");
        alertDialog.setMessage("Aceitamos os seguintes produtos recicláveis:\n\n" +
                "Metal,\n" +
                "Plástico,\n" +
                "Vidro,\n" +
                "Papel,\n" +
                "Outros (Definiremos em nossa mensagem ou ligação!)"+"\n");
        alertDialog.setNegativeButton("OK!", new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialog, int which) {
                dialog.cancel();
            }
        });
        alertDialog.show();

        mMap.setOnMapClickListener(new GoogleMap.OnMapClickListener() {


            @Override
            public void onMapClick(LatLng point) {
                mMap.clear();
                mMap.addMarker(new MarkerOptions()
                        .position(point)
                        .snippet(""));
                final double lat = point.latitude;
                final double lng = point.longitude;

                Geocoder geocoder = new Geocoder(getActivity(), Locale.getDefault());
                List<Address> addresses;
                try {
                    addresses = geocoder.getFromLocation(lat, lng, 1);

                    address = addresses.get(0).getAddressLine(0);
                    Toast.makeText(getActivity(),addresses.get(0).getAddressLine(0), Toast.LENGTH_SHORT).show();

                } catch (IOException e) {
                    Toast.makeText(getActivity(),"Localização Desconhecida! Digite Manualmente!", Toast.LENGTH_SHORT).show();


                }

                l1 = lat;
                l2 = lng;

            }

        });


        LatLng araruna = new LatLng(-6.532672, -35.739213);


        CameraPosition cameraPosition = new CameraPosition.Builder().zoom(15).target(araruna).build();


        mMap.animateCamera(CameraUpdateFactory.newCameraPosition(cameraPosition));

        FloatingActionButton floatingActionButton = getActivity().findViewById(R.id.btn1);
        floatingActionButton.setOnClickListener(new View.OnClickListener(){
            public void onClick(View view) {

                if (l1 != 0  || l2 != 0) {



                    android.support.v7.app.AlertDialog.Builder mBuilder = new android.support.v7.app
                            .AlertDialog.Builder(getActivity());
                    View mView = getActivity().getLayoutInflater().inflate(R.layout.dialog_login, null);
                    sp = (Spinner) mView.findViewById(R.id.spinner);

                    sp.setOnItemSelectedListener(new AdapterView.OnItemSelectedListener() {
                        @Override
                        public void onItemSelected(AdapterView<?> parent, View view, int position, long id) {
                            //int index = parent.getSelectedItemPosition();
                            String vnome = parent.getSelectedItem().toString();
                            item = vnome;
                        }

                        @Override
                        public void onNothingSelected(AdapterView<?> parent) {
                        }
                    });
                    final EditText nome = (EditText) mView.findViewById(R.id.nome);
                    final EditText endereco = (EditText) mView.findViewById(R.id.endereco);
                    final EditText bairro = (EditText) mView.findViewById(R.id.bairro);
                    final EditText telefone = (EditText) mView.findViewById(R.id.telefone);
                    final EditText texto = (EditText) mView.findViewById(R.id.texto);
                    Button mLogin = (Button) mView.findViewById(R.id.btnLogin);

                    endereco.setText(address);


                    mBuilder.setNegativeButton("Cancelar", new DialogInterface.OnClickListener() {
                        @Override
                        public void onClick(DialogInterface dialogInterface, int i) {
                            dialogInterface.dismiss();
                        }
                    });
                    mBuilder.setView(mView);
                    final android.support.v7.app.AlertDialog dialog = mBuilder.create();
                    dialog.show();

                    mLogin.setOnClickListener(new View.OnClickListener() {

                        @Override
                        public void onClick(View view) {

                            if (!nome.getText().toString().isEmpty() && !endereco.getText().toString().isEmpty() &&
                                    !bairro.getText().toString().isEmpty() && !telefone.getText().toString().isEmpty() &&
                                    !texto.getText().toString().isEmpty() && !item.isEmpty()) {


                                AlertDialog.Builder alertDialog = new AlertDialog.Builder(getActivity());
                                alertDialog.setTitle("Confirme seus Dados!");
                                alertDialog.setMessage("Nome: " + nome.getText().toString() + "\nEndereço: "
                                        + endereco.getText().toString() + "\nBairro: " + bairro.getText().toString()
                                        + "\nTelefone: " + telefone.getText().toString() + "\nDoação: "
                                        + texto.getText().toString() + "\nCategoria: " + item.toString());


                                alertDialog.setPositiveButton("Sim", new DialogInterface.OnClickListener() {
                                    public void onClick(DialogInterface dialog, int which) {
                                        SimpleDateFormat format = new SimpleDateFormat("dd-MM-yyyy-HH:mm:ss");
                                        Date data = new Date();
                                        LocationData locationData = new LocationData(l1, l2, nome.getText().toString(),
                                                endereco.getText().toString(), bairro.getText().toString(),
                                                telefone.getText().toString(), texto.getText().toString(), item.toString());

                                        mDatabase.child("location").child(String.valueOf(format.format(data)))
                                                .setValue(locationData);
                                        Toast.makeText(getActivity(), "Aguarde nossa Mensagem ou Ligação!",
                                                Toast.LENGTH_SHORT).show();


                                    }
                                });

                                alertDialog.setNegativeButton("Não", new DialogInterface.OnClickListener() {
                                    public void onClick(DialogInterface dialog, int which) {
                                        dialog.cancel();
                                    }
                                });

                                alertDialog.show();
                                dialog.dismiss();
                            } else {
                                Toast.makeText(getActivity(),
                                        R.string.error_login_msg,
                                        Toast.LENGTH_SHORT).show();
                            }

                        }

                    });
                } else {
                    Toast.makeText(getActivity(),"Marque sua localização no mapa!", Toast.LENGTH_SHORT).show();
                }

            }
        });
    }

    @Override
    public void onLocationChanged(Location location) {

    }



    @Override
    public void onStatusChanged(String provider, int status, Bundle extras) {

    }

    @Override
    public void onProviderEnabled(String provider) {

    }

    @Override
    public void onProviderDisabled(String provider) {

    }
}
