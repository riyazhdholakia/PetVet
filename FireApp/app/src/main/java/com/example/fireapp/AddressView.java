package com.example.fireapp;

import android.content.Intent;
import android.os.Bundle;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;

import com.firebase.client.ChildEventListener;
import com.firebase.client.DataSnapshot;
import com.firebase.client.Firebase;
import com.firebase.client.FirebaseError;

import java.util.ArrayList;

public class AddressView extends MainActivity{
    //Button button;
    private EditText mvaluefield11;
    private EditText mvaluefield12;
    private EditText mvaluefield13;
    private EditText mvaluefield14;
    private EditText mvaluefield15;
    private Button maddbtn1;
    private Firebase mrootref1;

    private Firebase mref;
    private ListView mlistview;
    private ArrayList<String> mUsernames=new ArrayList<>();
    //-------------------------------------

    //----------------------------------

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_addressview);

        mlistview = (ListView) findViewById(R.id.addressview);
        final ArrayAdapter<String> arrayAdapter = new ArrayAdapter<String>(this, android.R.layout.simple_list_item_1,mUsernames);
        mlistview.setAdapter(arrayAdapter);



        mref = new Firebase("https://fireapp-f1bdd.firebaseio.com/Addresses/AddressID1");
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
        });
        //------------------------------
        /*Firebase.setAndroidContext(this);
        mrootref1 = new Firebase("https://fireapp-f1bdd.firebaseio.com/Users/UserId1/Addresses");
        mvaluefield11 = (EditText) findViewById(R.id.valuefield11);
        mvaluefield12 = (EditText) findViewById(R.id.valuefield12);
        mvaluefield13 = (EditText) findViewById(R.id.valuefield13);
        mvaluefield14 = (EditText) findViewById(R.id.valuefield14);
        mvaluefield15 = (EditText) findViewById(R.id.valuefield15);
        maddbtn1 = (Button) findViewById(R.id.addressbtn);
        maddbtn1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                String key1="Street";
                String key2="City";
                String key3="State";
                String key4="Zip";
                String key5="Type";

                Firebase childref1=mrootref1.child("");
                Firebase childref2=childref1.push().child(key1);
                Firebase temp=childref2.getParent();
                Firebase childref3=temp.child(key2);
                Firebase childref4=temp.child(key3);
                Firebase childref5=temp.child(key4);
                Firebase childref6=temp.child(key5);
                //childref1.push().child(childref2);
                String value1=mvaluefield11.getText().toString();
                String value2=mvaluefield12.getText().toString();
                String value3=mvaluefield13.getText().toString();
                String value4=mvaluefield14.getText().toString();
                String value5=mvaluefield15.getText().toString();
                childref2.setValue(value1);
                childref3.setValue(value2);
                childref4.setValue(value3);
                childref5.setValue(value4);
                childref6.setValue(value5);

                //Firebase childref=mrootref.child(key);
                //String value=mvaluefield1.getText().toString();

                //String key="name";

                //childref.setValue(value);
                //childref.setValue(value);

            }
        });*/

    }

}
