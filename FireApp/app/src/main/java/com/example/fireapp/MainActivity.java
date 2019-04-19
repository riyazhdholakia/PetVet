package com.example.fireapp;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;

import com.firebase.client.Firebase;

import java.util.ArrayList;

public class MainActivity extends AppCompatActivity {
    private Button button;
    private Button button2;


    //------------
    private EditText mvaluefield1;
    private EditText mvaluefield2;
    private Button maddbtn;
    private Firebase mrootref;

    private Firebase mref;
    private ListView mlistview;
    private ArrayList<String> mUsernames=new ArrayList<>();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main_signup);
        //-----------------------------------------------------------
        /*button=(Button)findViewById(R.id.button2);
        button.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View v) {
                // TODO Auto-generated method stub
                Intent i = new Intent(MainActivity.this,Address.class);
                MainActivity.this.startActivity(i);
            }
        });*/

        button2=(Button)findViewById(R.id.login);
        button2.setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View v) {
                // TODO Auto-generated method stub
                Intent i1 = new Intent(MainActivity.this,Login.class);
                MainActivity.this.startActivity(i1);
            }
        });

        //----------------------------------------------------------

        //mlistview = (ListView) findViewById(R.id.listview);
        //final ArrayAdapter<String> arrayAdapter = new ArrayAdapter<String>(this, android.R.layout.simple_list_item_1,mUsernames);
        //mlistview.setAdapter(arrayAdapter);



        /*mref = new Firebase("https://fireapp-f1bdd.firebaseio.com/Users/UserId1/Addresses/AddressID1/");
        mref.addChildEventListener(new ChildEventListener() {
            @Override
            public void onChildAdded(DataSnapshot dataSnapshot, String s) {
                String value1= dataSnapshot.getValue(String.class);
                mUsernames.add(value1);
                arrayAdapter.notifyDataSetChanged();

            }

            @Override
            public void onChildChanged(DataSnapshot dataSnapshot, String s) {

            }

            @Override
            public void onChildRemoved(DataSnapshot dataSnapshot) {

            }

            @Override
            public void onChildMoved(DataSnapshot dataSnapshot, String s) {

            }

            @Override
            public void onCancelled(FirebaseError firebaseError) {

            }
        });*/
        //------------------------------
        Firebase.setAndroidContext(this);
        mrootref = new Firebase("https://fireapp-f1bdd.firebaseio.com/Users");
        mvaluefield1 = (EditText) findViewById(R.id.valuefield);
        mvaluefield2 = (EditText) findViewById(R.id.password);
        maddbtn = (Button) findViewById(R.id.addbtn);
        maddbtn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String key1="Name";
                String key2="Password";
                Firebase childref1=mrootref.child("");
                Firebase childref2=childref1.push().child(key1);
                Firebase temp=childref2.getParent();
                Firebase childref3=temp.child(key2);
                //childref1.push().child(childref2);
                String value1=mvaluefield1.getText().toString();
                String value2=mvaluefield2.getText().toString();
                childref2.setValue(value1);
                childref3.setValue(value2);

                //Firebase childref=mrootref.child(key);
                //String value=mvaluefield1.getText().toString();

                //String key="name";

                //childref.setValue(value);
                //childref.setValue(value);

            }
        });

    }



}
