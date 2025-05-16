// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//dk_upBSmoke

package 
{
    import flash.display.MovieClip;

    public dynamic class dk_upBSmoke extends MovieClip 
    {

        public function dk_upBSmoke()
        {
            addFrameScript(11, this.frame12);
        }

        internal function frame12():*
        {
            stop();
            parent.removeChild(this);
        }


    }
}//package 

