using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
using UnityEngine.AI;

public class ZombieController : MonoBehaviour
{

    bool awaken;
    public GameObject Player;
    public AudioClip sound1;
    public AudioClip sound2;
    public AudioSource aud;
    int tick;
    public GameObject spine;
    public GameObject LHand;
    public GameObject RHand;
    public GameObject LFoot;
    public GameObject RFoot;
    public GameObject neck;
    public GameObject body;
    public NavMeshAgent nav;
    int movementIndex;
    public Vector3 startPoz;


    bool secondTurn;
    int speed;

    void Awake()
    {
        awaken = false;
        aud = GetComponent<AudioSource>();
        tick = 50;
        Player = GameObject.Find("Cube");
        secondTurn = false;
        speed = 4;
        nav = body.GetComponent<NavMeshAgent>();
        movementIndex = 0;
        startPoz = transform.position;
    }

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void FixedUpdate()
    {
        float xDistance = Math.Abs(Player.transform.position.x - transform.position.x);
        float yDistance = Math.Abs(Player.transform.position.z - transform.position.z);
        
        if (awaken == false)
        {
            nav.enabled = false;

            if (xDistance<40 && yDistance<40 && Player.GetComponent<MoveYourself>().dead == false)
            {
                awaken = true;
            }
            sleepMove();
        } else
        {
            if (xDistance > 100 || yDistance > 100 || Player.GetComponent<MoveYourself>().dead == true)
            {
                awaken = false;
            }

            playSound();
            
            if (movementIndex > 1000)
            {
                movementIndex = 0;
            } else
            {
                movementIndex+=10;
            }

            if (movementIndex < 200)
            {
                MoveZombieBody(
                    new Vector3(-20, 10, 0),
                    new Vector3(-30, 0, 0),
                    new Vector3(16, 180, 96),
                    new Vector3(16, 175, -96),
                    new Vector3(20, 180, 0),
                    new Vector3(-5, 180, -20),
                    10
                    );
                nav.enabled = true;

            }
            else if (movementIndex < 400 || movementIndex>799)
            {
                MoveZombieBody(
                    new Vector3(10, 0, 0),
                    new Vector3(-10, 0, 0),
                    new Vector3(0, 200, 96),
                    new Vector3(-5, 185, -96),
                    new Vector3(0, 180, 20),
                    new Vector3(-5, 180, -20),
                    10
                    );
                nav.enabled = true;

            }
            else if (movementIndex < 600)
            {
                MoveZombieBody(
                    new Vector3(0, -5, 0),
                    new Vector3(-30, 0, 0),
                    new Vector3(40, 180, 96),
                    new Vector3(-30, 160, -96),
                    new Vector3(-15, 180, 40),
                    new Vector3(0, 170, -20),
                    10
                    );
                nav.enabled = false;

            }
            else if (movementIndex < 800)
            {
                MoveZombieBody(
                    new Vector3(10, -5, 0),
                    new Vector3(10, 0, 0),
                    new Vector3(20, 205, 96),
                    new Vector3(0, 140, -96),
                    new Vector3(15, 170, 0),
                    new Vector3(0, 170, 0),
                    10
                    );
                nav.enabled = false;

            }
            
        }
        if (Input.GetKey(KeyCode.R) && Player.GetComponent<MoveYourself>().dead == true)
        {
            transform.position = startPoz;
            awaken = false;
        }


        
        //body.transform.position = Vector3.MoveTowards(body.transform.position, Player.transform.position, Time.fixedDeltaTime*2);
        if (nav.enabled) {
                try
                {

                    nav.SetDestination(Player.transform.position);
                    nav.isStopped = false;
                }

                catch { nav.isStopped = true; }
                    
            }
        Vector3 lookPos = Player.transform.position - body.transform.position;
        var rotation = Quaternion.LookRotation(lookPos);
        body.transform.rotation = Quaternion.Slerp(body.transform.rotation, rotation, Time.deltaTime);
        

    }


    void playSound()
    {
        if (tick > 0)
        {
            tick--;
        }
        else
        {
            if (Player.GetComponent<MoveYourself>().dead == false)
            {

                if (UnityEngine.Random.Range(0, 2) == 0)
                {
                    aud.clip = sound1;
                }
                else
                {
                    aud.clip = sound2;
                }
                float xDistance = Math.Abs(Player.transform.position.x - transform.position.x) * 2;
                float yDistance = Math.Abs(Player.transform.position.z - transform.position.z) * 2;
                int volume = 30 - (int)Math.Round(xDistance) / 4 - (int)Math.Round(yDistance) / 4;
                if (volume < 0) volume = 0;
                aud.volume = volume;
                aud.Play();
                tick = UnityEngine.Random.Range(150, 350);
            }
        }
    }

    void sleepMove()
    {
        if (secondTurn == true)
        {
            if (spine.transform.localRotation.x > -0.06)
            {
                MoveZombieBody(
                    new Vector3(-10,10,-10),
                    new Vector3(-26, 0, 0),
                    new Vector3(0, 180, 96),
                    new Vector3(0, 175, -96),
                    new Vector3(0, 180, 20),
                    new Vector3(-20, 180, 0),
                    2
                    );

            }
            else
            {
                secondTurn = false;
            }
        }
        else
        {
            if (spine.transform.localRotation.x < 0.06)
            {
                MoveZombieBody(
                    new Vector3(10, -10, 10),
                    new Vector3(10, 0, 0),
                    new Vector3(30, 200, 96),
                    new Vector3(30, 155, -96),
                    new Vector3(20, 180, 0),
                    new Vector3(0, 180, 20)
                    ,2
                    );
            }
            else
            {
                secondTurn = true;
 
            }

        }
    }

    void MoveZombieBody(Vector3 s, Vector3 n, Vector3 lh, Vector3 rh, Vector3 lf, Vector3 rf, int multi)
    {
        spine.transform.localRotation = Quaternion.RotateTowards(spine.transform.localRotation, Quaternion.Euler(s), speed * Time.deltaTime*multi);
        LHand.transform.localRotation = Quaternion.RotateTowards(LHand.transform.localRotation, Quaternion.Euler(lh), speed * Time.deltaTime * multi);
        RHand.transform.localRotation = Quaternion.RotateTowards(RHand.transform.localRotation, Quaternion.Euler(rh), speed * Time.deltaTime * multi);
        neck.transform.localRotation = Quaternion.RotateTowards(neck.transform.localRotation, Quaternion.Euler(n), speed * Time.deltaTime * multi);
        LFoot.transform.localRotation = Quaternion.RotateTowards(LFoot.transform.localRotation, Quaternion.Euler(lf), speed * Time.deltaTime * multi);
        RFoot.transform.localRotation = Quaternion.RotateTowards(RFoot.transform.localRotation, Quaternion.Euler(rf), speed * Time.deltaTime * multi);
    }

    void OnCollisionEnter(Collision other)
    {
        if (other.gameObject.tag == "Player" && Player.GetComponent<MoveYourself>().dead == false)
        {
            Player.GetComponent<MoveYourself>().death();
        }
    }
}
