package com.suporte.amigo;

import android.content.DialogInterface;
import android.content.Intent;
import android.support.design.widget.FloatingActionButton;
import android.support.v7.app.AlertDialog;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.text.TextUtils;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.Spinner;
import android.widget.Toast;

import com.google.firebase.FirebaseApp;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;

import java.util.ArrayList;
import java.util.List;

public class MainActivity extends AppCompatActivity {
    public static final String ARTIST_NAME = "com.suporte.amigo.artistname";
    public static final String ARTIST_ID = "com.suporte.amigo.artistid";

    EditText editTextName;
    Spinner spinnerGenre;
    Button buttonAdd;
    ListView listViewArtists;
    FirebaseDatabase firebaseDatabase;
    //a list to store all the artist from firebase database
    List<Artist> artists;

    //our database reference object
    DatabaseReference databaseArtists;


    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        inicializarFirebase();
        //getting the reference of artists node
        databaseArtists = FirebaseDatabase.getInstance().getReference("artists");

        //getting views
        listViewArtists = (ListView) findViewById(R.id.listViewArtists);

        //list to store artists
        artists = new ArrayList<>();

        FloatingActionButton fab1 = (FloatingActionButton) findViewById(R.id.add);
        fab1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                android.support.v7.app.AlertDialog.Builder mBuilder = new android.support.v7.app.AlertDialog.Builder(MainActivity.this);
                View mView = MainActivity.this.getLayoutInflater().inflate(R.layout.activity_cadastro, null);


                Button mLogin = (Button) mView.findViewById(R.id.btnLogin);


                mLogin.setOnClickListener(new View.OnClickListener() {

                    @Override
                    public void onClick(View view) {
                    }


                });

                mBuilder.setNegativeButton("Cancelar", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialogInterface, int i) {
                        dialogInterface.dismiss();
                    }
                });
                mBuilder.setView(mView);
                final android.support.v7.app.AlertDialog dialog = mBuilder.create();
                dialog.show();

            }
        });


        FloatingActionButton fab2 = (FloatingActionButton) findViewById(R.id.search);
        fab2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
//                AlertDialog.Builder dialogBuilder = new AlertDialog.Builder(MainActivity.this);
//                LayoutInflater inflater = getLayoutInflater();
//                final View dialogView = inflater.inflate(R.layout.activity_pdfcreator, null);
//                dialogBuilder.setView(dialogView);
//
//                final EditText editTextName = (EditText) dialogView.findViewById(R.id.editTextName);
//                final Button buttonUpdate = (Button) dialogView.findViewById(R.id.procurar);
//                final AlertDialog b = dialogBuilder.create();
//                b.show();

//                buttonUpdate.setOnClickListener(new View.OnClickListener() {
//                    @Override
//                    public void onClick(View view) {
//                        String name = editTextName.getText().toString();
//
//                        if (!TextUtils.isEmpty(name)) {
//                            Toast.makeText(MainActivity.this, editTextName.getText().toString().trim(), Toast.LENGTH_SHORT).show();
//                            b.dismiss();
//                        }
//                    }
//                });

                Intent intent = new Intent(getApplicationContext(), PDFCreatorActivity.class);
                startActivity(intent);
            }
        });


        //attaching listener to listview
        listViewArtists.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int i, long l) {

            }
        });

        listViewArtists.setOnItemLongClickListener(new AdapterView.OnItemLongClickListener() {
            @Override
            public boolean onItemLongClick(AdapterView<?> adapterView, View view, int i, long l) {
//                Artist artist = artists.get(i);
//                showUpdateDeleteDialog(artist.getArtistId(), artist.getArtistName());
//
//                android.support.v7.app.AlertDialog.Builder mBuilder = new android.support.v7.app.AlertDialog.Builder(MainActivity.this);
//                View mView = MainActivity.this.getLayoutInflater().inflate(R.layout.activity_update, null);
//
//
//                Button mLogin = (Button) mView.findViewById(R.id.btnLogin);
//
//
//                mLogin.setOnClickListener(new View.OnClickListener() {
//
//                    @Override
//                    public void onClick(View view) {
//                    }
//
//
//                });
//
//                mBuilder.setNegativeButton("Cancelar", new DialogInterface.OnClickListener() {
//                    @Override
//                    public void onClick(DialogInterface dialogInterface, int i) {
//                        dialogInterface.dismiss();
//                    }
//                });
//                mBuilder.setView(mView);
//                final android.support.v7.app.AlertDialog dialog = mBuilder.create();
//                dialog.show();

                //getting the selected artist
//                Artist artist = artists.get(i);

                //creating an intent
                Intent intent = new Intent(getApplicationContext(), UpdateActivity.class);

                //putting artist name and id to intent
//                intent.putExtra(ARTIST_ID, artist.getArtistId());
//                intent.putExtra(ARTIST_NAME, artist.getArtistName());

                //starting the activity with intent
                startActivity(intent);

                return true;
            }
        });



    }

//    private void showUpdateDeleteDialog(final String artistId, String artistName) {
//
//        AlertDialog.Builder dialogBuilder = new AlertDialog.Builder(this);
//        LayoutInflater inflater = getLayoutInflater();
//        final View dialogView = inflater.inflate(R.layout.serach_dialog, null);
//        dialogBuilder.setView(dialogView);
//
//        final EditText editTextName = (EditText) dialogView.findViewById(R.id.editTextName);
//        final Button buttonUpdate = (Button) dialogView.findViewById(R.id.buttonUpdateArtist);
//        final Button buttonDelete = (Button) dialogView.findViewById(R.id.buttonDeleteArtist);
//
//        dialogBuilder.setTitle(artistName);
//        final AlertDialog b = dialogBuilder.create();
//        b.show();
//
//
//        buttonUpdate.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View view) {
//                String name = editTextName.getText().toString().trim();
//                String genre = spinnerGenre.getSelectedItem().toString();
//                if (!TextUtils.isEmpty(name)) {
//                    updateArtist(artistId, name, genre);
//                    b.dismiss();
//                }
//            }
//        });
//
//
//        buttonDelete.setOnClickListener(new View.OnClickListener() {
//            @Override
//            public void onClick(View view) {
//
//                deleteArtist(artistId);
//                b.dismiss();
//            }
//        });
//    }



    private boolean updateArtist(String id, String name, String genre) {
        //getting the specified artist reference
        DatabaseReference dR = FirebaseDatabase.getInstance().getReference("artists").child(id);

        //updating artist
        Artist artist = new Artist(id, name, genre);
        dR.setValue(artist);
        Toast.makeText(getApplicationContext(), "Artist Updated", Toast.LENGTH_LONG).show();
        return true;
    }

    private boolean deleteArtist(String id) {
        //getting the specified artist reference
        DatabaseReference dR = FirebaseDatabase.getInstance().getReference("artists").child(id);

        //removing artist
        dR.removeValue();

        //getting the tracks reference for the specified artist
        DatabaseReference drTracks = FirebaseDatabase.getInstance().getReference("tracks").child(id);

        //removing all tracks
        drTracks.removeValue();
        Toast.makeText(getApplicationContext(), "Artist Deleted", Toast.LENGTH_LONG).show();

        return true;
    }

    private void inicializarFirebase() {
        FirebaseApp.initializeApp(MainActivity.this);
        firebaseDatabase = FirebaseDatabase.getInstance();
        firebaseDatabase.setPersistenceEnabled(true);
        databaseArtists = firebaseDatabase.getReference();
    }

    @Override
    protected void onStart() {
        super.onStart();
        //attaching value event listener
        databaseArtists.addValueEventListener(new ValueEventListener() {
            @Override
            public void onDataChange(DataSnapshot dataSnapshot) {

                //clearing the previous artist list
                artists.clear();

                //iterating through all the nodes
                for (DataSnapshot postSnapshot : dataSnapshot.getChildren()) {
                    //getting artist
                    Artist artist = postSnapshot.getValue(Artist.class);
                    //adding artist to the list
                    artists.add(artist);
                }

                //creating adapter
                ArtistList artistAdapter = new ArtistList(MainActivity.this, artists);
                //attaching adapter to the listview
                listViewArtists.setAdapter(artistAdapter);
            }

            @Override
            public void onCancelled(DatabaseError databaseError) {
            }
        });
    }


    /*
    * This method is saving a new artist to the
    * Firebase Realtime Database
    * */
    private void addArtist() {
        //getting the values to save
        String name = editTextName.getText().toString().trim();
        String genre = spinnerGenre.getSelectedItem().toString();

        //checking if the value is provided
        if (!TextUtils.isEmpty(name)) {

            //getting a unique id using push().getKey() method
            //it will create a unique id and we will use it as the Primary Key for our Artist
            String id = databaseArtists.push().getKey();

            //creating an Artist Object
            Artist artist = new Artist(id, name, genre);

            //Saving the Artist
            databaseArtists.child(id).setValue(artist);

            //setting edittext to blank again
            editTextName.setText("");

            //displaying a success toast
            Toast.makeText(this, "Artist added", Toast.LENGTH_LONG).show();
        } else {
            //if the value is not given displaying a toast
            Toast.makeText(this, "Please enter a name", Toast.LENGTH_LONG).show();
        }
    }
}
