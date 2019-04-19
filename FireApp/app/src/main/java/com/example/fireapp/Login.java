package com.example.fireapp;

import android.content.Intent;
import android.os.Bundle;
import android.support.annotation.NonNull;
import android.support.v7.app.AppCompatActivity;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.EditText;
import android.widget.ListView;
import android.widget.Toast;

import com.firebase.client.ChildEventListener;
import com.firebase.client.Firebase;
import com.firebase.client.FirebaseError;
import com.google.android.gms.tasks.OnCompleteListener;
import com.google.android.gms.tasks.Task;
import com.google.firebase.auth.AuthResult;
import com.google.firebase.auth.FirebaseAuth;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;
import com.google.firebase.database.ValueEventListener;
import com.google.firebase.database.Query;
//import com.example.fireapp.Model.Users


import java.util.ArrayList;

public class Login extends MainActivity{
    private EditText mvaluefield11;
    private EditText mvaluefield12;
    private Button maddbtn1;
    private FirebaseAuth mAuth;
    private FirebaseAuth.AuthStateListener mAuthListener;

    private Firebase mref;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        mAuth=FirebaseAuth.getInstance();
        mAuthListener = new FirebaseAuth.AuthStateListener() {
            @Override
            public void onAuthStateChanged(@NonNull FirebaseAuth firebaseAuth) {
                if (firebaseAuth.getCurrentUser()!=null){
                    startActivity(new Intent(Login.this,List.class));
                }
            }
        };


        mref = new Firebase("https://fireapp-f1bdd.firebaseio.com/Users");
        mvaluefield11 = (EditText) findViewById(R.id.fieldvalue1);
        mvaluefield12 = (EditText) findViewById(R.id.fieldvalue2);
        maddbtn1 = (Button) findViewById(R.id.loginbutton);
        maddbtn1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                String value1=mvaluefield11.getText().toString();
                String value2=mvaluefield12.getText().toString();
                signIn(value1,value2);
                //Intent i = new Intent(Login.this,AddressView.class);
                //Login.this.startActivity(i);
            }

    });

}

    @Override
    protected void onStart() {
        super.onStart();
        mAuth.addAuthStateListener(mAuthListener);
    }

    private void signIn(final String value1, final String value2) {
        mAuth.signInWithEmailAndPassword(value1,value2).addOnCompleteListener(new OnCompleteListener<AuthResult>() {
            @Override
            public void onComplete(@NonNull Task<AuthResult> task) {
                if (!task.isSuccessful()){
                    Toast.makeText(Login.this, "Login Problem", Toast.LENGTH_SHORT).show();
                }
            }
        });
        //=============
        /*Users.addListenerForSingleValueEvent(new ValueEventListener() {
            @Override
            public void onDataChange(@NonNull DataSnapshot dataSnapshot) {
                if (dataSnapshot.child(value1).exists()){
                    if (!value1.isEmpty()){
                        login = dataSnapshot.child(value1).getValue(Users.class);

                        //if (login.().equals(value2)){
                            Toast.makeText(Login.this, "Success Login", Toast.LENGTH_SHORT).show();
                        //}
                        //else{
                          //  Toast.makeText(Login.this, "Success Wrong", Toast.LENGTH_SHORT).show();
                        //}
                    }
                }
            }

            @Override
            public void onCancelled(@NonNull DatabaseError databaseError) {

            }
        });*/
    }
    }
