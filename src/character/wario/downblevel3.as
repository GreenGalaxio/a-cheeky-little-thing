// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//downblevel3

package 
{
    import flash.display.MovieClip;

    public dynamic class downblevel3 extends MovieClip 
    {

        public function downblevel3()
        {
            addFrameScript(17, this.frame18);
        }

        internal function frame18():*
        {
            stop();
            parent.removeChild(this);
        }


    }
}//package 

