using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class My_Sprite : MonoBehaviour
{
    public Sprite[] Sprites;
    private SpriteRenderer sr;
    public int id;
    public bool dead;
    public bool turn;
    public AudioSource aus;
    public AudioClip[] Clips;
    private bool calledDeath ;

    // Start is called before the first frame update
    void Start()
    {
        sr = GetComponent<SpriteRenderer>();
        aus = GetComponent<AudioSource>();
        dead = false;
        turn = false;
        calledDeath = false;

        StartCoroutine(ChangeSprite());

    }

    // Update is called once per frame
    void Update()
    {
        if (dead==true)
        {
            if (calledDeath == false) StartCoroutine(Death());

        }
    }

    IEnumerator Death(){
        calledDeath = true;

            while(true){
                if (turn == false)
                {
                    aus.PlayOneShot(Clips[0]);
                    sr.sprite = Sprites[Sprites.Length - 1];
                }
                else
                {
                    Destroy(gameObject);
                }

                turn = !turn;
                yield return new WaitForSeconds((float)0.25);
            }
    }     

    IEnumerator ChangeSprite()
    {
        while (true)
        {

            if (dead == false)
            {
                if (turn == false)
                {
                    sr.sprite = Sprites[id * 2];
                }
                else
                {
                    sr.sprite = Sprites[(id * 2) + 1];
                }

                turn = !turn;
            }
            


            yield return new WaitForSeconds((float)GameObject.Find("back").GetComponent<Manage_Enemies>().enemies.Count/(float)10.0);
        }
    }
}
