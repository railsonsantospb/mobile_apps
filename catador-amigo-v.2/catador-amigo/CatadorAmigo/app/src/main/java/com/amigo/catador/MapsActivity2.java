package com.amigo.catador;

import android.app.AlertDialog;
import android.app.Fragment;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.location.Address;
import android.location.Geocoder;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.os.Build;
import android.os.Bundle;
import android.provider.Settings;
import android.support.annotation.Nullable;
import android.support.design.widget.FloatingActionButton;
import android.support.v4.app.ActivityCompat;
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
import com.google.android.gms.maps.model.Marker;
import com.google.android.gms.maps.model.MarkerOptions;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

public class MapsActivity2 extends Fragment implements OnMapReadyCallback, LocationListener {

    private GoogleMap mMap;
    double lat = 0, lng = 0;
    private Marker currentLocationMaker;
    private LatLng currentLocationLatLong;
    private FirebaseDatabase firebase = FirebaseDatabase.getInstance();
    private DatabaseReference mDatabase = firebase.getReference();
    String item;
    Spinner sp;
    String address = "";

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        startGettingLocations();
        mDatabase = FirebaseDatabase.getInstance().getReference();
        return inflater.inflate(R.layout.activity_maps2, container,false);
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

        LatLng araruna = new LatLng(-6.532672, -35.739213);


        CameraPosition cameraPosition = new CameraPosition.Builder().zoom(15).target(araruna).build();
        mMap.animateCamera(CameraUpdateFactory.newCameraPosition(cameraPosition));



        FloatingActionButton floatingActionButton = getActivity().findViewById(R.id.btn2);
        floatingActionButton.setOnClickListener(new View.OnClickListener(){
            public void onClick(View view){
                try{
                    lat = currentLocationLatLong.latitude;
                    lng = currentLocationLatLong.longitude;
                    Geocoder geocoder = new Geocoder(getActivity(), Locale.getDefault());
                    List<Address> addresses;
                    try {
                        addresses = geocoder.getFromLocation(lat, lng, 1);

                        address = addresses.get(0).getAddressLine(0);
                        Toast.makeText(getActivity(),addresses.get(0).getAddressLine(0), Toast.LENGTH_SHORT).show();

                    } catch (IOException e) {
                        Toast.makeText(getActivity(),"Localização Desconhecida! Digite Manualmente!", Toast.LENGTH_SHORT).show();


                    }
                } catch (Exception e){
                    lat = 0;
                    lng = 0;
                }


                if (lat != 0  || lng != 0) {

                    android.support.v7.app.AlertDialog.Builder mBuilder = new android.support.v7
                            .app.AlertDialog.Builder(getActivity());
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
                                    !texto.getText().toString().isEmpty()) {


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

                                        LocationData locationData = new LocationData(lat, lng, nome.getText().toString(),
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
                    Toast.makeText(getActivity(),"Não foi possível obter sua localização, tente " +
                            "novamente!", Toast.LENGTH_SHORT).show();
                }
            }
        });
    }

    @Override
    public void onLocationChanged(Location location) {
        try {
            if (currentLocationMaker != null) {
                currentLocationMaker.remove();
            }
            //Add marker
            currentLocationLatLong = new LatLng(location.getLatitude(), location.getLongitude());
            MarkerOptions markerOptions = new MarkerOptions();
            markerOptions.position(currentLocationLatLong);
            markerOptions.title("Minha Localização Atual!");
            markerOptions.icon(BitmapDescriptorFactory.defaultMarker(BitmapDescriptorFactory.HUE_BLUE));
            currentLocationMaker = mMap.addMarker(markerOptions);

            //Move to new location
            CameraPosition cameraPosition = new CameraPosition.Builder().zoom(15).target(currentLocationLatLong).build();
            mMap.animateCamera(CameraUpdateFactory.newCameraPosition(cameraPosition));
            Toast.makeText(getActivity(), "Localização Atualizada!", Toast.LENGTH_SHORT).show();
        } catch (Exception e){

        }
    }

    private ArrayList findUnAskedPermissions(ArrayList<String> wanted) {
        ArrayList result = new ArrayList();

        for (String perm : wanted) {
            if (!hasPermission(perm)) {
                result.add(perm);
            }
        }

        return result;
    }

    private boolean hasPermission(String permission) {
        if (canAskPermission()) {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                return (getActivity().checkSelfPermission(permission) == PackageManager.PERMISSION_GRANTED);
            }
        }
        return true;
    }

    private boolean canAskPermission() {
        return (Build.VERSION.SDK_INT > Build.VERSION_CODES.LOLLIPOP_MR1);
    }

    public void showSettingsAlert() {
        AlertDialog.Builder alertDialog = new AlertDialog.Builder(getActivity());
        alertDialog.setTitle("GPS desativado!");
        alertDialog.setMessage("Ativar GPS?");
        alertDialog.setPositiveButton("Sim", new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialog, int which) {
                Intent intent = new Intent(Settings.ACTION_LOCATION_SOURCE_SETTINGS);
                startActivity(intent);
            }
        });

        alertDialog.setNegativeButton("Não", new DialogInterface.OnClickListener() {
            public void onClick(DialogInterface dialog, int which) {
                dialog.cancel();
            }
        });

        alertDialog.show();
    }

    private void startGettingLocations() {

        LocationManager lm = (LocationManager) getActivity().getSystemService(Context.LOCATION_SERVICE);

        boolean isGPS = lm.isProviderEnabled(LocationManager.GPS_PROVIDER);
        boolean isNetwork = lm.isProviderEnabled(LocationManager.NETWORK_PROVIDER);
        boolean canGetLocation = true;
        int ALL_PERMISSIONS_RESULT = 101;
        long MIN_DISTANCE_CHANGE_FOR_UPDATES = 10;// Distance in meters
        long MIN_TIME_BW_UPDATES = 1000 * 10;// Time in milliseconds

        ArrayList<String> permissions = new ArrayList<>();
        ArrayList<String> permissionsToRequest;

        permissions.add(android.Manifest.permission.ACCESS_FINE_LOCATION);
        permissions.add(android.Manifest.permission.ACCESS_COARSE_LOCATION);
        permissionsToRequest = findUnAskedPermissions(permissions);

        //Check if GPS and Network are on, if not asks the user to turn on
        if (!isGPS && !isNetwork) {
            showSettingsAlert();
        } else {
            // check permissions

            // check permissions for later versions
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                if (permissionsToRequest.size() > 0) {
                    requestPermissions(permissionsToRequest.toArray(new String[permissionsToRequest.size()]),
                            ALL_PERMISSIONS_RESULT);
                    canGetLocation = false;
                }
            }
        }


        //Checks if FINE LOCATION and COARSE Location were granted
        if (ActivityCompat.checkSelfPermission(getActivity(),
                android.Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED &&
                ActivityCompat.checkSelfPermission(getActivity(), android.Manifest.permission.ACCESS_COARSE_LOCATION)
                        != PackageManager.PERMISSION_GRANTED) {

            Toast.makeText(getActivity(), "Permissão negada", Toast.LENGTH_SHORT).show();
            return;
        }

        //Starts requesting location updates
        if (canGetLocation) {
            if (isGPS) {
                lm.requestLocationUpdates(
                        LocationManager.GPS_PROVIDER,
                        MIN_TIME_BW_UPDATES,
                        MIN_DISTANCE_CHANGE_FOR_UPDATES, this);

            } else if (isNetwork) {
                // from Network Provider

                lm.requestLocationUpdates(
                        LocationManager.NETWORK_PROVIDER,
                        MIN_TIME_BW_UPDATES,
                        MIN_DISTANCE_CHANGE_FOR_UPDATES, this);

            }
        } else {
            Toast.makeText(getActivity(), "Não é possível obter sua localização", Toast.LENGTH_SHORT).show();
        }
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

    @Override
    public void onPause() {
        super.onPause();
    }
}
