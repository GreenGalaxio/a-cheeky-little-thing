// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//fireballexplosion

package 
{
    import flash.display.MovieClip;

    public dynamic class fireballexplosion extends MovieClip 
    {

        public function fireballexplosion()
        {
            addFrameScript(10, this.frame11);
        }

        internal function frame11():*
        {
            stop();
            parent.removeChild(this);
        }


    }
}//package 

