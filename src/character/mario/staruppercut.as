// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//staruppercut

package 
{
    import flash.display.MovieClip;

    public dynamic class staruppercut extends MovieClip 
    {

        public function staruppercut()
        {
            addFrameScript(26, this.frame27);
        }

        internal function frame27():*
        {
            stop();
            parent.removeChild(this);
        }


    }
}//package 

