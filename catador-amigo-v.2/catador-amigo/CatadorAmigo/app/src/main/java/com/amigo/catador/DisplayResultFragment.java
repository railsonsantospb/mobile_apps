package com.amigo.catador;


import android.os.Bundle;
import android.support.v4.app.DialogFragment;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.FrameLayout;
import android.widget.ImageView;

import com.amigo.catador.R;


/**
 * A simple {@link Fragment} subclass.
 */
public class DisplayResultFragment extends DialogFragment {


    public DisplayResultFragment() {
        // Required empty public constructor
    }


    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container,
                             Bundle savedInstanceState) {
        // Inflate the layout for this fragment
        View rootView = inflater.inflate(R.layout.fragment_display_result, container, false);
        View rootView1 = inflater.inflate(R.layout.activity_quiz, container, false);
        setCancelable(false);

        ImageView stateImageView = rootView.findViewById(R.id.state_image_result);
        ImageView stateImageView1 = rootView1.findViewById(R.id.afink);
//        TextView stateTextView = rootView.findViewById(R.id.state_text);
//        TextView correctAnswersTextView = rootView.findViewById(R.id.quantity_answers_correct_text);
        stateImageView1.setImageResource(R.drawable.afink);

        int quantity_answers_correct = QuizActivity.quantity_answers_correct;


//        correctAnswersTextView.setText("Sua Pontuação: " + String.valueOf(quantity_answers_correct));
        FrameLayout okButton = rootView.findViewById(R.id.ok_button);
        okButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                dismiss();
            }
        });
        if (quantity_answers_correct <= 23) {
            stateImageView.setImageResource(R.drawable.score_4);
//            stateTextView.setText(getString(R.string.state_happy));
        } else if (quantity_answers_correct > 23 && quantity_answers_correct <= 44) {
            stateImageView.setImageResource(R.drawable.score_3);
//            stateTextView.setText(getString(R.string.state_sad));

        } else if (quantity_answers_correct > 44 && quantity_answers_correct <= 66) {
            stateImageView.setImageResource(R.drawable.score_2);
//            stateTextView.setText(getString(R.string.state_cryze));

        } else {
            stateImageView.setImageResource(R.drawable.score_1);
//            stateTextView.setText(getString(R.string.state_cry));
        }

        return rootView;

    }

}
