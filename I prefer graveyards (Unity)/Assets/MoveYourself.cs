using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MoveYourself : MonoBehaviour
{
    Rigidbody rg;
    private int speed;
    GameObject torch;
    Rigidbody torchBody;
    public Vector3 startPoz;
    public bool dead;
    AudioSource aud;
    public AudioClip[] clips;
    public GameObject screamer;
    Quaternion startRotation;
    public GameObject t;
    bool colliding;

void Awake()
    {
        rg = GetComponent<Rigidbody>();
        aud = GetComponent<AudioSource>();
        speed = 3;
        torch = GameObject.Find("OldTorch");
        torchBody = torch.GetComponent<Rigidbody>();
        Camera.main.transform.localPosition = new Vector3(0, 1, 0);



        startPoz = transform.position;
        startRotation = transform.rotation;
        dead = false;
        
    }

    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    void FixedUpdate()
    {
        if (Input.GetKey(KeyCode.Escape)) Application.Quit();

            if (dead == false)
            {

            if (Input.GetKey(KeyCode.LeftArrow))
            {
                moveTorchBody(new Vector3(0.700f, 0.45f, 1.08f), new Vector3(0, 0, 30));

                transform.Rotate(0, -speed, 0, Space.Self);
            }

            if (Input.GetKey(KeyCode.RightArrow))
            {
                moveTorchBody(new Vector3(-0.155f, 0.600f, 0.88f), new Vector3(0, 0, 60));
                transform.Rotate(0, speed, 0, Space.Self);
            }

            if (Input.GetKey(KeyCode.UpArrow) || Input.GetKey(KeyCode.W))
            {
                moveTorchBody(new Vector3(0.255f, 0.25f, 1.08f), new Vector3(70, 0, 0));

                rg.MovePosition(transform.position + (transform.forward * Time.fixedDeltaTime * speed * 10));
            }

            if (Input.GetKey(KeyCode.DownArrow) || Input.GetKey(KeyCode.S))
            {
                moveTorchBody(new Vector3(0.400f, 0.50f, 1.08f), new Vector3(0, 0, 30));
                rg.MovePosition(transform.position + (transform.forward * Time.fixedDeltaTime * speed * -10));
            }
            if (Input.GetKey(KeyCode.A))
            {
                moveTorchBody(new Vector3(0.700f, 0.45f, 1.08f), new Vector3(0, 0, 30));
                transform.Translate(Vector3.left * Time.fixedDeltaTime * speed * 10, Space.Self);

            }
            if (Input.GetKey(KeyCode.D))
            {
                moveTorchBody(new Vector3(-0.155f, 0.600f, 0.88f), new Vector3(0, 0, 60));
                transform.Translate(Vector3.right * Time.fixedDeltaTime * speed * 10, Space.Self);

            }

            if (Input.anyKey == false)
            {
                moveTorchBody(new Vector3(0.315f, 0.383f, 0.88f), new Vector3(25, 0, 0));
            }

            if (colliding == false || dead == true)
            {
                rg.velocity = Vector3.zero;
            }

           colliding = false;
            
        } else
        {

            if (Camera.main.transform.localPosition.y > -0.50) Camera.main.transform.position -= new Vector3(0, .5f, 0);
            moveTorchBody(new Vector3(0.350f, -0.6f, 1.08f), new Vector3(85, 10, 20));
            if (Input.GetKey(KeyCode.R)==true)
            {
                dead = false;
                transform.position = startPoz;
                transform.rotation = startRotation;
                t.GetComponent<tex>().text.text = "0";
                Camera.main.transform.localPosition = new Vector3(0, 1, 0);

            }
        }
        //if (Input.GetKey(KeyCode.D)) dead = true;

    }
    void OnCollisionEnter(Collision other)
    {
        if (other.gameObject.tag=="Zombie" && dead == false)
        {
            death();
        }

        colliding = true;
    }

    public void death()
    {
        dead = true;
        screamer.GetComponent<screamer>().aud.clip = clips[Random.Range(0, 3)];
        screamer.GetComponent<screamer>().aud.Play();

    }
    void moveTorchBody(Vector3 poz, Vector3 rot)
    {
       
            torchBody.transform.localPosition = Vector3.MoveTowards(torchBody.transform.localPosition, poz, Time.deltaTime);
            torchBody.transform.localRotation = Quaternion.RotateTowards(torchBody.transform.localRotation, Quaternion.Euler(rot), 100 * speed * Time.fixedDeltaTime);

    }

}
