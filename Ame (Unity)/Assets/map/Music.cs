using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Music : MonoBehaviour
{

    public AudioClip[] music;
    public AudioSource Aud;


    // Start is called before the first frame update
    void Awake()
    {
        Aud = GetComponent<AudioSource>();


    }
    
    void Start()
    {


    }

    // Update is called once per frame
    void Update()
    {
        
    }
}
