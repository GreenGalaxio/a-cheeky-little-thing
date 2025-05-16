// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//dustTrail

package 
{
    import flash.display.MovieClip;

    public dynamic class dustTrail extends MovieClip 
    {

        public function dustTrail()
        {
            addFrameScript(16, this.frame17, 17, this.frame18);
        }

        internal function frame17():*
        {
            if (parent != null)
            {
                parent.removeChild(this);
            };
        }

        internal function frame18():*
        {
            gotoAndPlay("done");
        }


    }
}//package 

