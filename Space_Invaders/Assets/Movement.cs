using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using System;

public class Movement : MonoBehaviour
{

    public bool dead;
    private int speed = 5;
    public bool shoot;
    public Sprite[] SpriteCollection;
    private SpriteRenderer sr;
    public AudioSource aus;
    public AudioClip[] Clips;
    private bool sorryImDead;
    public int points = 0;
    private bool ffff;
    private Coroutine Death;
    private Text scoreText;

    // Start is called before the first frame update
    void Start()
    {
        aus = GetComponent<AudioSource>();
        sr = GetComponent<SpriteRenderer>();
        setDefaults();
        scoreText = GameObject.Find("Score").GetComponent<Text>();
    }


    void setDefaults()
    {
        dead = false;
        shoot = false;
        sorryImDead = false;
        points = 0;
        ffff = false;
        transform.position = new Vector3(0, -4, 0);
        foreach (GameObject G in GameObject.FindGameObjectsWithTag("Removable"))
        {
            Destroy(G);
        }
        GameObject.Find("back").GetComponent<Manage_Enemies>().enemies.Clear();
        GameObject.Find("back").GetComponent<RandomShoot>().shootNumber=0;
        if (Death != null)
        {
            StopCoroutine(Death);
        }
        GameObject.Find("back").GetComponent<Manage_Enemies>().move_position = 0;
        GameObject.Find("back").GetComponent<Manage_Enemies>().moveLeft = false;


    }

    // Update is called once per frame
    void Update()
    {

        scoreText.text = String.Format("Score: {0:000000}", points.ToString("000000"));


        if (dead == false)
        {
            sr.sprite = SpriteCollection[0];
            if (Death != null)
            {
                StopCoroutine(Death);
            }
        }
        else
        {
            sr.sprite = SpriteCollection[1];
            if (sorryImDead == false)
            {
                sorryImDead = true;
                Death = StartCoroutine(DeathStuff());
            }

        }


        if (dead == false)
        {
            float PosX = Camera.current.WorldToScreenPoint(transform.position).x;

            if (Input.GetKey(KeyCode.LeftArrow))
            {

                if (PosX > 20) transform.position -= new Vector3(speed * Time.deltaTime, 0, 0);

            }
            else
            {
                if (Input.GetKey(KeyCode.RightArrow))
                {
                    if (PosX < Screen.width - 20) transform.position += new Vector3(speed * Time.deltaTime, 0, 0);

                }
            }

            if (Input.GetKey(KeyCode.Space) && shoot == false)
            {
                shoot = true;
                GameObject prefab = (GameObject)Resources.Load("Shoot");
                Instantiate(prefab, new Vector3(transform.position.x, transform.position.y, 0), Quaternion.identity);
            }

        }
    }

    IEnumerator DeathStuff()
    {
        while (true)
        {

            if (ffff == true) setDefaults();
            if (dead == false) break;
            ffff = true;

            yield return new WaitForSeconds((float)1.0);

        }

    }
}
