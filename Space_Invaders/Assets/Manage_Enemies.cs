using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class Manage_Enemies : MonoBehaviour
{

    private AudioSource aus;
    public AudioClip[] Clips;
    private int soundCounter;
    private GameObject prefab;
    public List<GameObject> enemies;
    public bool moveLeft;
    public int move_position;
    public List<GameObject> Shields;


    // Start is called before the first frame update
    void Start()
    {
        enemies = new List<GameObject>();
        aus = GetComponent<AudioSource>();
        soundCounter = 0;
        StartCoroutine(MoveThings());
        moveLeft = false;
        move_position = 0;
        Shields = new List<GameObject>();

    }

    // Update is called once per frame
    void Update()
    {
        if (enemies.Count == 0)
        {


            for (float x = (float)-3.5; x < (float)2.5; ++x)
            {

                for (float y = (float)4.5; y > (float)0.5; --y)
                {
                    prefab = (GameObject)Resources.Load("Enemy");
                    GameObject LastObject = Instantiate(prefab, new Vector3(x, y, 0), Quaternion.identity);
                    LastObject.GetComponent<My_Sprite>().id = Convert.ToInt32((float)4.5-y);
                    enemies.Add(LastObject);

                }

            }

            Shields.Clear();
            for (float x = (float)-3.0; x < (float)4.5; x+=2)
            {
                prefab = (GameObject)Resources.Load("Shield");
                GameObject LastObject = Instantiate(prefab, new Vector3(x, -2, 0), Quaternion.identity);

                Shields.Add(LastObject);
                LastObject = Instantiate(prefab, new Vector3(x + (float)0.5, -2, 0), Quaternion.identity);
                Shields.Add(LastObject);

            }


        }

        float Lowest = (float)9999.0;

        foreach (GameObject G in enemies) {
            if (G.transform.position.y < Lowest) Lowest = G.transform.position.y;
        }

        if (Lowest == -1)
        {
            foreach (GameObject G in Shields)
            {
                Destroy(G);
            }
            Shields.Clear();

        }
        else if (Lowest == -3)
        {
            GameObject.Find("Player").GetComponent<Movement>().dead = true;
            GameObject.Find("Player").GetComponent<Movement>().aus.PlayOneShot(GameObject.Find("Player").GetComponent<Movement>().Clips[0]);

        }
    }


    void Move(float x, float y)
    {
        foreach (GameObject G in enemies)
        {
            G.transform.position += new Vector3((float)x, (float)y, 0);
        }
    }

    IEnumerator MoveThings()
    {

        while (true)
        {

            if (move_position == 5)
            {
                moveLeft = !moveLeft;
                move_position = 0;
                Move((float)0, (float)-0.5);


            }
            else
            {
                if (moveLeft == true)
                {
                    Move((float)-0.5, (float)0);
                }
                else
                {
                    Move((float)0.5, (float)0);
                }
                move_position++;
            }


            aus.PlayOneShot(Clips[soundCounter]);


            if (soundCounter == 3)
            {
                soundCounter = 0;
            }
            else
            {
                soundCounter++;
            }

            yield return new WaitForSeconds((float)enemies.Count / (float)10.0);
        }

    }
}
