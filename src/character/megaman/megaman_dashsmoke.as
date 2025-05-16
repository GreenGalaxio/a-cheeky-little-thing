// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//megaman_dashsmoke

package 
{
    import flash.display.MovieClip;

    public dynamic class megaman_dashsmoke extends MovieClip 
    {

        public function megaman_dashsmoke()
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

